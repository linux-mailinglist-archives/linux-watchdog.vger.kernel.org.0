Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17FA32DC69F
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Dec 2020 19:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731321AbgLPSgm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Dec 2020 13:36:42 -0500
Received: from mga03.intel.com ([134.134.136.65]:17036 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727974AbgLPSgm (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Dec 2020 13:36:42 -0500
IronPort-SDR: g9FxWxn4Tc58+m7icyZf2y8aSfH07R6VpLINvwKj31F/BZf4ac0KSjJ/M5dpXaCCzvausWBkhn
 xpxKPWvrQJrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="175219372"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="175219372"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 10:36:00 -0800
IronPort-SDR: fP4Kwp9ruu0kC8+ef7Jzj0tOcZ1d7/FMTDBNVmuZyfWGsYOhBGzdOKVCX7ppLjyYyareC1ey6Q
 8cmCcTtb5xLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="488644728"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2020 10:35:57 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com, chen.yong.seow@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v4 0/2] Add drivers for Intel Keem Bay SoC watchdog
Date:   Thu, 17 Dec 2020 02:32:46 +0800
Message-Id: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>

Hi,

This patch set adds the watchdog timer driver support for Intel Keem Bay Soc.

Patch 2 holds the driver and Patch 1 holds the Device Tree
binding documentation.

This driver was tested on the Keem Bay evaluation module board.

Thank you,
Vijay

Changes since v3:
 - Fix pretimeout clear, when user attempt in the below sequence.
	- set pretimeout
	- clear pretimeout
	- set timeout to some other value
 - Cleanup the ping variable usage in the driver.
 - Add keembay_wdt_set_timeout_reg function.
 - Cleanup the keembay_wdt_th_isr function.
 - Rebase the driver with 5.10-rc7 tag.

Changes since v2:
 - Remove reduntant write to TIM_WATCHDOG as per Guenter.
 - Rebase the driver with 5.10-rc5 tag.

Changes since v1:
 - Fix indentation error in the dt-bindings file.
 - Use true/false in the second arg of keembay_wdt_set_timeout_reg().
 - Fix the watchdog start sequence.
 - Avoid reduntant timeout register setting.
 - Remove min usage to find actual time at keembay_wdt_set_timeout().
 - Remove timeout configuration boundary check at
   keembay_wdt_set_pretimeout().
 - Use devm_watchdog_register_device() for wdt registration, which
   eventually supports driver unload functionality as well.

Vijayakannan Ayyathurai (2):
  dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
  watchdog: Add watchdog driver for Intel Keembay Soc

 .../bindings/watchdog/intel,keembay-wdt.yaml  |  57 ++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/keembay_wdt.c                | 286 ++++++++++++++++++
 4 files changed, 357 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
 create mode 100644 drivers/watchdog/keembay_wdt.c


base-commit: 0477e92881850d44910a7e94fc2c46f96faa131f
prerequisite-patch-id: 822987dcf4c969ef6ac70359b088af06ba39042b
prerequisite-patch-id: 0a348762b660d0d817b8e70cc71647e83173c78c
prerequisite-patch-id: 54c661a006c7362053cb7602448d6c77419d5cf9
prerequisite-patch-id: d140d8534fb828778e0652fe5fcf6282e027f985
-- 
2.17.1

