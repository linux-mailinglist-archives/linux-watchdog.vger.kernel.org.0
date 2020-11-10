Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6762ADD7D
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Nov 2020 18:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgKJR4C (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Nov 2020 12:56:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:52230 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKJR4C (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Nov 2020 12:56:02 -0500
IronPort-SDR: QmvahAriZXqjYOEQFV5EOwozcVY1V/moZxu5Nw2CrrSXmJDRXco3xfxvbgnNccrb8mAQ2ZAaqF
 i61gXfGR3b1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166511388"
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; 
   d="scan'208";a="166511388"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 09:56:00 -0800
IronPort-SDR: dhX+iH+iz9kBFEnJ7CyvsLC6Oq2NUMab90dL768d8zk9OWdR5KsIyvWgJBSX97uggwml0WNFUn
 j4R1zx5AuGrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; 
   d="scan'208";a="338795355"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2020 09:55:57 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v2 0/2] Add drivers for Intel Keem Bay SoC watchdog
Date:   Wed, 11 Nov 2020 01:53:06 +0800
Message-Id: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
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
 drivers/watchdog/keembay_wdt.c                | 288 ++++++++++++++++++
 4 files changed, 359 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
 create mode 100644 drivers/watchdog/keembay_wdt.c


base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
prerequisite-patch-id: 822987dcf4c969ef6ac70359b088af06ba39042b
prerequisite-patch-id: 0a348762b660d0d817b8e70cc71647e83173c78c
prerequisite-patch-id: 54c661a006c7362053cb7602448d6c77419d5cf9
prerequisite-patch-id: d140d8534fb828778e0652fe5fcf6282e027f985
-- 
2.17.1

