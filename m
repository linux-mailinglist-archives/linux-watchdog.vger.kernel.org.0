Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2351C2CA6BA
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Dec 2020 16:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391658AbgLAPOU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Dec 2020 10:14:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:12580 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391642AbgLAPOT (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Dec 2020 10:14:19 -0500
IronPort-SDR: 4325MPau0qcb7r32zy7zjQWaZxMjXEaDF2bIFEn9gnVmJ1ZBi2SG66LkBTKDr2yNf9jQmrmC4w
 7pzN3+9o9z2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="160612254"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="160612254"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:13:37 -0800
IronPort-SDR: Oy0AYMPFFxWZBA6UVruHVQuFV7Lp3fdIj1dlh1GASYmhU5QdrAhKx4f5sYUNofbjIt/39Ze57i
 mdmh0R59MssA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="364774684"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2020 07:13:33 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v3 0/2] Add drivers for Intel Keem Bay SoC watchdog
Date:   Tue,  1 Dec 2020 23:10:32 +0800
Message-Id: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>

Hi,

This patch set adds the watchdog timer driver support for Intel Keem Bay Soc.

Patch 1 holds the driver and Patch 2 holds the Device Tree
binding documentation.

This driver was tested on the Keem Bay evaluation module board.

Thank you,
Vijay

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
  watchdog: Add watchdog driver for Intel Keembay Soc
  dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC

 .../bindings/watchdog/intel,keembay-wdt.yaml  |  57 ++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/keembay_wdt.c                | 284 ++++++++++++++++++
 4 files changed, 355 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
 create mode 100644 drivers/watchdog/keembay_wdt.c


base-commit: 418baf2c28f3473039f2f7377760bd8f6897ae18
prerequisite-patch-id: 822987dcf4c969ef6ac70359b088af06ba39042b
prerequisite-patch-id: 0a348762b660d0d817b8e70cc71647e83173c78c
prerequisite-patch-id: 54c661a006c7362053cb7602448d6c77419d5cf9
prerequisite-patch-id: d140d8534fb828778e0652fe5fcf6282e027f985
-- 
2.17.1

