Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63FFE53E5F3
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jun 2022 19:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241855AbiFFQmA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jun 2022 12:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbiFFQl4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jun 2022 12:41:56 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE722BD;
        Mon,  6 Jun 2022 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654533714; x=1686069714;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PuD+XkjvNTTehA+a3gWnWgL8PXJajHjYvjG4npSfsms=;
  b=e/eX0tu1d5GFE3q8GAreKP6R4T6UAHRB6StAyYBDbt5dYg48wWuto+/t
   SPYdi3xWQ7F8XZdX32iSNa/6GtH/ne7PS6F1aw+CZwCUfCTKTz2yX6hii
   ef8BUC+RJ22VNszbQ+K3K0WsMensvJdmRsJz/zWkXlvIjAigFeLSshugf
   hBLVOK9OAUTys/rP269h8uiW+2OyOnY3VA+zrV2PnNFsUoQFOP30QNrvj
   mWdt0CP8buo56SfxLi8ZmzNB8r2ggotSfMNRTlFVc0E0AlLJxsnaPaicP
   eQdKTn+2/d6YkPw90dQpeVVHo1ssPVap9kPx8mhz7y0Aq6K/xP52dg30J
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="257114169"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="257114169"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="647618752"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2022 09:41:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4C80FF8; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Date:   Mon,  6 Jun 2022 19:41:26 +0300
Message-Id: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There are a few users that would like to utilize P2SB mechanism of hiding
and unhiding a device from the PCI configuration space.

Here is the series to consolidate p2sb handling code for existing users
and to provide a generic way for new comer(s).

It also includes a patch to enable GPIO controllers on Apollo Lake
when it's used with ABL bootloader w/o ACPI support.

The patch that brings the helper ("platform/x86/intel: Add Primary to
Sideband (P2SB) bridge support") has a commit message that sheds a light
on what the P2SB is and why this is needed.

I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
since we have an ACPI device for GPIO I do not see any attempts to recreate
one).

The series is ready to be merged via MFD tree, but see below.

The series also includes updates for Simatic IPC drivers that partially
tagged by respective maintainers (the main question is if Pavel is okay
with the last three patches, since I believe Hans is okay with removing
some code under PDx86). Hence the first 8 patches can be merged right
away and the rest when Pavel does his review.

Changes in v6:
- added tag to patch 5 (Lee)
- incorporated Henning's series on top of v5

Changes in v5:
- rewritten patch 1 to use pci_scan_single_device() (Lukas, Bjorn)
- rebased patch 2 on top of the new Intel SPI NOR codebase
- fixed a potential bug and rewritten resource filling in patch 5 (Lee)
- added many different tags in a few patches (Jean, Wolfram, Henning)

Changes in v4:
- added tag to the entire series (Hans)
- added tag to pin control patch (Mika)
- dropped PCI core changes (PCI core doesn't want modifications to be made)
- as a consequence of the above merged necessary bits into p2sb.c
- added a check that p2sb is really hidden (Hans)
- added EDAC patches (reviewed by maintainer internally)

Changes in v3:
- resent with cover letter

Changes in v2:
- added parentheses around bus in macros (Joe)
- added tag (Jean)
- fixed indentation and wrapping in the header (Christoph)
- moved out of PCI realm to PDx86 as the best common denominator (Bjorn)
- added a verbose commit message to explain P2SB thingy (Bjorn)
- converted first parameter from pci_dev to pci_bus
- made first two parameters (bus and devfn) optional (Henning, Lee)
- added Intel pin control patch to the series (Henning, Mika)
- fixed English style in the commit message of one of MFD patch (Lee)
- added tags to my MFD LPC ICH patches (Lee)
- used consistently (c) (Lee)
- made indexing for MFD cell and resource arrays (Lee)
- fixed the resource size in i801 (Jean)

Andy Shevchenko (6):
  pinctrl: intel: Check against matching data instead of ACPI companion
  mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
  mfd: lpc_ich: Switch to generic p2sb_bar()
  i2c: i801: convert to use common P2SB accessor
  EDAC, pnd2: Use proper I/O accessors and address space annotation
  EDAC, pnd2: convert to use common P2SB accessor

Henning Schild (4):
  watchdog: simatic-ipc-wdt: convert to use P2SB accessor
  leds: simatic-ipc-leds: convert to use P2SB accessor
  platform/x86: simatic-ipc: drop custom P2SB bar code
  leds: simatic-ipc-leds-gpio: add GPIO version of Siemens driver

Jonathan Yong (1):
  platform/x86/intel: Add Primary to Sideband (P2SB) bridge support

Tan Jui Nee (1):
  mfd: lpc_ich: Add support for pinctrl in non-ACPI system

 drivers/edac/Kconfig                          |   1 +
 drivers/edac/pnd2_edac.c                      |  62 +++----
 drivers/i2c/busses/Kconfig                    |   1 +
 drivers/i2c/busses/i2c-i801.c                 |  39 +----
 drivers/leds/simple/Kconfig                   |   6 +-
 drivers/leds/simple/Makefile                  |   1 +
 drivers/leds/simple/simatic-ipc-leds-gpio.c   | 105 ++++++++++++
 drivers/leds/simple/simatic-ipc-leds.c        |  80 +--------
 drivers/mfd/Kconfig                           |   1 +
 drivers/mfd/lpc_ich.c                         | 161 ++++++++++++++----
 drivers/pinctrl/intel/pinctrl-intel.c         |  14 +-
 drivers/platform/x86/intel/Kconfig            |  12 ++
 drivers/platform/x86/intel/Makefile           |   2 +
 drivers/platform/x86/intel/p2sb.c             | 133 +++++++++++++++
 drivers/platform/x86/simatic-ipc.c            |  43 +----
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/simatic-ipc-wdt.c            |  15 +-
 include/linux/platform_data/x86/p2sb.h        |  28 +++
 .../platform_data/x86/simatic-ipc-base.h      |   2 -
 19 files changed, 464 insertions(+), 243 deletions(-)
 create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio.c
 create mode 100644 drivers/platform/x86/intel/p2sb.c
 create mode 100644 include/linux/platform_data/x86/p2sb.h


base-commit: 40b58e42584bf5bd9230481dc8946f714fb387de
-- 
2.35.1

