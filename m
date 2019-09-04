Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8D2EA7F8B
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Sep 2019 11:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbfIDJiE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Sep 2019 05:38:04 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:23633 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfIDJiD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Sep 2019 05:38:03 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x849bnb5030463;
        Wed, 4 Sep 2019 18:37:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x849bnb5030463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567589870;
        bh=CgmmuzVkhVQ+o1CkaLANRBuCyNbfCQSFWOCba3Tazjw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cc4YDaUiFhyrvPlS08sc6wubjrBJJg3n2+cRI9xGWFslrPGUoQVo/8BTbWDMUcyAJ
         ULzI7TWgXHe78IobvE/RDJ27izWkmmMApkpoYJvidQEPSd8iqWdjPbV3T2hMmCUscv
         VHysTQqUyhHNrNSp4daCOYiJ8P2KJggjDFomFpYPAdXWqUZqZ2Lo8H5G29fNmZ+U7W
         J7E8QLp4nGNwIXMPaoHx57b+K8x06AUd49ywk6liYjHDFm/KwncCbKvfBaBIlhTF37
         r77+DCrE4Hfta87nKDcojEMv+wThfZlViAMNcuJx39xGak3bbiBwlw7bj9BeJXsAc8
         jcfow+pV+dVww==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id m62so13325434vsc.8;
        Wed, 04 Sep 2019 02:37:49 -0700 (PDT)
X-Gm-Message-State: APjAAAU6wbK6wIWyIq/ozXkA0lQd5gX1AhBokafpC4UEZp5XZ4Nd38yB
        QWtDCGDyVZjqapjyDw8HchHw0zKYjSiSBUzIfCw=
X-Google-Smtp-Source: APXvYqxH9/1NkppRKxnXt9oQjnGl1dmb5P5bz0Rh2NAIoKzwHdtZVq+9w5NOKqnfRJ4H8aK8fucFWaX7Nj+Ho56tyV4=
X-Received: by 2002:a67:e9cc:: with SMTP id q12mr11780704vso.181.1567589868735;
 Wed, 04 Sep 2019 02:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 18:37:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAStNtY=xGyUM6cJTH-DTmoHE5b-ba_BGxoAJyJ_0-6O_A@mail.gmail.com>
Message-ID: <CAK7LNAStNtY=xGyUM6cJTH-DTmoHE5b-ba_BGxoAJyJ_0-6O_A@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Symbol Namespaces
To:     Matthias Maennich <maennich@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        maco@android.com, sspatil@google.com,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Sep 4, 2019 at 12:07 AM Matthias Maennich <maennich@google.com> wrote:
>
> As of Linux 5.3-rc7, there are 31207 [1] exported symbols in the kernel.
> That is a growth of roughly 1000 symbols since 4.17 (30206 [2]). There
> seems to be some consensus amongst kernel devs that the export surface
> is too large, and hard to reason about.
>
> Generally, these symbols fall in one of these categories:
> 1) Symbols actually meant for drivers
> 2) Symbols that are only exported because functionality is split over
>    multiple modules, yet they really shouldn't be used by modules outside
>    of their own subsystem
> 3) Symbols really only meant for in-tree use
>
> When module developers try to upstream their code, it regularly turns
> out that they are using exported symbols that they really shouldn't be
> using. This problem is even bigger for drivers that are currently
> out-of-tree, which may be using many symbols that they shouldn't be
> using, and that break when those symbols are removed or modified.
>
> This patch allows subsystem maintainers to partition their exported
> symbols into separate namespaces, and module authors to import such
> namespaces only when needed.
>
> This allows subsystem maintainers to more easily limit availability of
> these namespaced symbols to other parts of the kernel. It can also be
> used to partition the set of exported symbols for documentation
> purposes; for example, a set of symbols that is really only used for
> debugging could be in a "SUBSYSTEM_DEBUG" namespace.


Why is the namespace helpful to limit the availability of symbols?
External modules would add whatever EXPORT_SYMBOL_NS() needed
to use the symbols.
Nothing would change except that it would increase the code size.




If we introduce the namespace, do symbols no longer
need to be globally unique?

Theoretically, we could do this:

EXPORT_SYMBOL_NS(foo, SUBSYSTEM_A);   (for Subsystem-A)
EXPORT_SYMBOL_NS(foo, SUBSYSTEM_B);   (for Subsystem-B)


But, I do not see benefit to do so.


We usually prefix symbol names with the sybsystem names
(usb_ ...  ,  watchdog_ ...).

By ensuring the symbol uniqueness,
it is really clear which functions are called.
You can easily grep the source code.
Editors can follow the code with tag files.

Adding namespace just introduces extra complexity.


Thanks.


>
> The series contains two RFC patches that do not need to be merged along
> with the rest of the series, but they serve as a reference for using the
> symbol namespaces. Especially, the watchdog subsystem might not be
> affected by the issues addressed by Symbol Namespaces. I left the patch
> in for reference anyway for demonstration purposes.
>
> I continued the work mainly done by Martijn Coenen.
>
> Changes in v2:
> - Rather than adding and evaluating separate sections __knsimport_NS,
>   use modinfo tags to declare the namespaces a module introduces.
>   Adjust modpost and the module loader accordingly.
> - Also add support for reading multiple modinfo values for the same tag
>   to allow list-like access to modinfo tags.
> - The macros in export.h have been cleaned up to avoid redundancy in the
>   macro parameters (ns, nspost, nspost2).
> - The introduction of relative references in the ksymtab entries caused
>   a rework of the macros to accommodate that configuration as well.
> - Alignment of kernel_symbol in the ksymtab needed to be fixed to allow
>   growing the kernel_symbol struct.
> - Modpost does now also append the namespace suffix to the symbol
>   entries in Module.symvers.
> - The configuration option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS allows
>   relaxing the enforcement of properly declared namespace imports at
>   module loading time.
> - Symbols can be collectively exported into a namespace by defining
>   DEFAULT_SYMBOL_NAMESPACE in the corresponding Makefile.
> - The requirement for a very recent coccinelle spatch has been lifted by
>   simplifying the script.
> - nsdeps does now ensures MODULE_IMPORT_NS statements are sorted when
>   patching the module source files.
> - Some minor bugs have been addressed in nsdeps to allow it to work with
>   modules that have more than one source file.
> - The RFC for the usb-storage symbols has been simplified by using
>   DEFAULT_SYMBOL_NAMESPACE=USB_STORAGE rather than explicitly exporting
>   each and every symbol into that new namespace.
>
> Changes in v3:
> - Reword the documentation for the
>   MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS option for clarification.
> - Fix printed required version of spatch in coccinelle script.
> - Adopt kbuild changes for modpost: .mod files are no longer generated
>   in .tmp_versions. Similarely, generate the .ns_deps files in the tree
>   along with the .mod files. Also, nsdeps now uses modules.order as
>   source for the list modules to consider.
> - Add an RFC patch to introduce the namespace WATCHDOG_CORE for symbols
>   exported in watchdog_core.c.
>
> Changes in v4:
> - scripts/nsdeps:
>   - exit on first error
>   - support out-of-tree builds O=...
> - scripts/mod/modpost: make the namespace a separate field when
>   exporting to Module.symvers (rather than symbol.NS)
> - scripts/export_report.pl: update for new Module.symvers format
> - include/linux/export.h: fixed style nits
> - kernel/module.c: ensure namespaces are imported before taking a
>   reference to the owner module
> - Documentation: document the Symbol Namespace feature and update
>   references to Module.symvers and EXPORT_SYMBOL*
>
> This patch series was developed against v5.3-rc7.
>
> [1] git grep "^EXPORT_SYMBOL\w*(" v5.3-rc7 | wc -l
> [2] git grep "^EXPORT_SYMBOL\w*(" v4.17    | wc -l
>
> Cc: arnd@arndb.de
> Cc: gregkh@linuxfoundation.org
> Cc: jeyu@kernel.org
> Cc: joel@joelfernandes.org
> Cc: lucas.de.marchi@gmail.com
> Cc: maco@android.com
> Cc: sspatil@google.com
> Cc: will@kernel.org
> Cc: yamada.masahiro@socionext.com
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-modules@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: usb-storage@lists.one-eyed-alien.net
> Cc: linux-watchdog@vger.kernel.org
>
>
> Matthias Maennich (12):
>   module: support reading multiple values per modinfo tag
>   export: explicitly align struct kernel_symbol
>   module: add support for symbol namespaces.
>   modpost: add support for symbol namespaces
>   module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
>   export: allow definition default namespaces in Makefiles or sources
>   modpost: add support for generating namespace dependencies
>   scripts: Coccinelle script for namespace dependencies.
>   docs: Add documentation for Symbol Namespaces
>   usb-storage: remove single-use define for debugging
>   RFC: usb-storage: export symbols in USB_STORAGE namespace
>   RFC: watchdog: export core symbols in WATCHDOG_CORE namespace
>
>  .gitignore                                  |   1 +
>  Documentation/kbuild/modules.rst            |   7 +-
>  Documentation/kbuild/namespaces.rst         | 154 ++++++++++++++++++++
>  Documentation/kernel-hacking/hacking.rst    |  18 +++
>  MAINTAINERS                                 |   5 +
>  Makefile                                    |  14 +-
>  arch/m68k/include/asm/export.h              |   1 -
>  drivers/hwmon/ftsteutates.c                 |   1 +
>  drivers/hwmon/sch56xx-common.c              |   1 +
>  drivers/rtc/rtc-abx80x.c                    |   1 +
>  drivers/usb/storage/Makefile                |   2 +
>  drivers/usb/storage/alauda.c                |   1 +
>  drivers/usb/storage/cypress_atacb.c         |   1 +
>  drivers/usb/storage/datafab.c               |   1 +
>  drivers/usb/storage/debug.h                 |   2 -
>  drivers/usb/storage/ene_ub6250.c            |   1 +
>  drivers/usb/storage/freecom.c               |   1 +
>  drivers/usb/storage/isd200.c                |   1 +
>  drivers/usb/storage/jumpshot.c              |   1 +
>  drivers/usb/storage/karma.c                 |   1 +
>  drivers/usb/storage/onetouch.c              |   1 +
>  drivers/usb/storage/realtek_cr.c            |   1 +
>  drivers/usb/storage/scsiglue.c              |   2 +-
>  drivers/usb/storage/sddr09.c                |   1 +
>  drivers/usb/storage/sddr55.c                |   1 +
>  drivers/usb/storage/shuttle_usbat.c         |   1 +
>  drivers/usb/storage/uas.c                   |   1 +
>  drivers/watchdog/armada_37xx_wdt.c          |   1 +
>  drivers/watchdog/asm9260_wdt.c              |   1 +
>  drivers/watchdog/aspeed_wdt.c               |   1 +
>  drivers/watchdog/at91sam9_wdt.c             |   1 +
>  drivers/watchdog/atlas7_wdt.c               |   1 +
>  drivers/watchdog/bcm2835_wdt.c              |   1 +
>  drivers/watchdog/bcm47xx_wdt.c              |   1 +
>  drivers/watchdog/bcm7038_wdt.c              |   1 +
>  drivers/watchdog/bcm_kona_wdt.c             |   1 +
>  drivers/watchdog/bd70528_wdt.c              |   1 +
>  drivers/watchdog/cadence_wdt.c              |   1 +
>  drivers/watchdog/da9052_wdt.c               |   1 +
>  drivers/watchdog/da9055_wdt.c               |   1 +
>  drivers/watchdog/da9062_wdt.c               |   1 +
>  drivers/watchdog/da9063_wdt.c               |   1 +
>  drivers/watchdog/davinci_wdt.c              |   1 +
>  drivers/watchdog/digicolor_wdt.c            |   1 +
>  drivers/watchdog/dw_wdt.c                   |   1 +
>  drivers/watchdog/ebc-c384_wdt.c             |   1 +
>  drivers/watchdog/ep93xx_wdt.c               |   1 +
>  drivers/watchdog/ftwdt010_wdt.c             |   1 +
>  drivers/watchdog/gpio_wdt.c                 |   1 +
>  drivers/watchdog/hpwdt.c                    |   1 +
>  drivers/watchdog/i6300esb.c                 |   1 +
>  drivers/watchdog/iTCO_wdt.c                 |   1 +
>  drivers/watchdog/ie6xx_wdt.c                |   1 +
>  drivers/watchdog/imgpdc_wdt.c               |   1 +
>  drivers/watchdog/imx2_wdt.c                 |   1 +
>  drivers/watchdog/intel-mid_wdt.c            |   1 +
>  drivers/watchdog/it87_wdt.c                 |   1 +
>  drivers/watchdog/kempld_wdt.c               |   1 +
>  drivers/watchdog/lpc18xx_wdt.c              |   1 +
>  drivers/watchdog/max63xx_wdt.c              |   1 +
>  drivers/watchdog/max77620_wdt.c             |   1 +
>  drivers/watchdog/mei_wdt.c                  |   1 +
>  drivers/watchdog/mena21_wdt.c               |   1 +
>  drivers/watchdog/menf21bmc_wdt.c            |   1 +
>  drivers/watchdog/menz69_wdt.c               |   1 +
>  drivers/watchdog/meson_gxbb_wdt.c           |   1 +
>  drivers/watchdog/meson_wdt.c                |   1 +
>  drivers/watchdog/mlx_wdt.c                  |   1 +
>  drivers/watchdog/moxart_wdt.c               |   1 +
>  drivers/watchdog/mtk_wdt.c                  |   1 +
>  drivers/watchdog/ni903x_wdt.c               |   1 +
>  drivers/watchdog/nic7018_wdt.c              |   1 +
>  drivers/watchdog/npcm_wdt.c                 |   1 +
>  drivers/watchdog/of_xilinx_wdt.c            |   1 +
>  drivers/watchdog/omap_wdt.c                 |   1 +
>  drivers/watchdog/pm8916_wdt.c               |   1 +
>  drivers/watchdog/qcom-wdt.c                 |   1 +
>  drivers/watchdog/rave-sp-wdt.c              |   1 +
>  drivers/watchdog/renesas_wdt.c              |   1 +
>  drivers/watchdog/retu_wdt.c                 |   1 +
>  drivers/watchdog/rn5t618_wdt.c              |   1 +
>  drivers/watchdog/rza_wdt.c                  |   1 +
>  drivers/watchdog/s3c2410_wdt.c              |   1 +
>  drivers/watchdog/sama5d4_wdt.c              |   1 +
>  drivers/watchdog/sirfsoc_wdt.c              |   1 +
>  drivers/watchdog/softdog.c                  |   1 +
>  drivers/watchdog/sp5100_tco.c               |   1 +
>  drivers/watchdog/sprd_wdt.c                 |   1 +
>  drivers/watchdog/st_lpc_wdt.c               |   1 +
>  drivers/watchdog/stmp3xxx_rtc_wdt.c         |   1 +
>  drivers/watchdog/stpmic1_wdt.c              |   1 +
>  drivers/watchdog/sunxi_wdt.c                |   1 +
>  drivers/watchdog/tangox_wdt.c               |   1 +
>  drivers/watchdog/tegra_wdt.c                |   1 +
>  drivers/watchdog/tqmx86_wdt.c               |   1 +
>  drivers/watchdog/ts4800_wdt.c               |   1 +
>  drivers/watchdog/ts72xx_wdt.c               |   1 +
>  drivers/watchdog/twl4030_wdt.c              |   1 +
>  drivers/watchdog/uniphier_wdt.c             |   1 +
>  drivers/watchdog/via_wdt.c                  |   1 +
>  drivers/watchdog/w83627hf_wdt.c             |   1 +
>  drivers/watchdog/watchdog_core.c            |  10 +-
>  drivers/watchdog/wdat_wdt.c                 |   1 +
>  drivers/watchdog/wm831x_wdt.c               |   1 +
>  drivers/watchdog/wm8350_wdt.c               |   1 +
>  drivers/watchdog/xen_wdt.c                  |   1 +
>  drivers/watchdog/ziirave_wdt.c              |   1 +
>  include/asm-generic/export.h                |  14 +-
>  include/linux/export.h                      |  98 +++++++++++--
>  include/linux/module.h                      |   2 +
>  init/Kconfig                                |  13 ++
>  kernel/module.c                             |  67 ++++++++-
>  scripts/Makefile.modpost                    |   4 +-
>  scripts/coccinelle/misc/add_namespace.cocci |  23 +++
>  scripts/export_report.pl                    |   2 +-
>  scripts/mod/modpost.c                       | 150 ++++++++++++++++---
>  scripts/mod/modpost.h                       |   9 ++
>  scripts/nsdeps                              |  60 ++++++++
>  118 files changed, 697 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/kbuild/namespaces.rst
>  create mode 100644 scripts/coccinelle/misc/add_namespace.cocci
>  create mode 100644 scripts/nsdeps
>
> --
> 2.23.0.187.g17f5b7556c-goog
>


-- 
Best Regards
Masahiro Yamada
