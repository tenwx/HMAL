package x.y.z.ui.fragment

import android.os.Bundle
import com.google.android.material.transition.MaterialSharedAxis
import 1x.y.z.R
import x.y.z.service.ConfigManager
import x.y.z.ui.adapter.AppManageAdapter
import x.y.z.ui.util.navController

class AppManageFragment : AppSelectFragment() {

    override val firstComparator: Comparator<String> = Comparator.comparing(ConfigManager::isHideEnabled).reversed()

    override val adapter = AppManageAdapter {
        val args = AppSettingsFragmentArgs(it)
        navController.navigate(R.id.nav_app_settings, args.toBundle())
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enterTransition = MaterialSharedAxis(MaterialSharedAxis.Z, true)
        returnTransition = MaterialSharedAxis(MaterialSharedAxis.Z, false)
    }
}
