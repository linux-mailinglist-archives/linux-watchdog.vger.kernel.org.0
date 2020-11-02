Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0265C2A2427
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Nov 2020 06:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbgKBF0K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Nov 2020 00:26:10 -0500
Received: from mga03.intel.com ([134.134.136.65]:63323 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbgKBF0J (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Nov 2020 00:26:09 -0500
IronPort-SDR: jjEFfxAa/WQJbLgilQNCKCrEPDSMK5CQrv+foaUpr8IgTCysoVhZi3nbJXOsfOhHD7uCrPWWDR
 oXB3Iikp3G7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="168935534"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="168935534"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2020 21:26:09 -0800
IronPort-SDR: xO16usgA2i2n2FyqpymOlD0kf6vNfDeP7PegILmjRGWzwL4NPaTmIjjmWz9ulcYHv8qDaoKvKu
 aMc0ZweNDivQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="319953342"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by orsmga003.jf.intel.com with ESMTP; 01 Nov 2020 21:26:06 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v1 0/2] Add drivers for Intel Keem Bay SoC watchdog
Date:   Mon,  2 Nov 2020 13:23:10 +0800
Message-Id: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
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

Vijayakannan Ayyathurai (2):
  watchdog: Add watchdog driver for Intel Keembay Soc
  dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC

 .../bindings/watchdog/intel,keembay-wdt.yaml  |  57 ++++
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/keembay_wdt.c                | 293 ++++++++++++++++++
 4 files changed, 364 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
 create mode 100644 drivers/watchdog/keembay_wdt.c


base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
prerequisite-patch-id: 822987dcf4c969ef6ac70359b088af06ba39042b
prerequisite-patch-id: 0a348762b660d0d817b8e70cc71647e83173c78c
prerequisite-patch-id: 54c661a006c7362053cb7602448d6c77419d5cf9
prerequisite-patch-id: d140d8534fb828778e0652fe5fcf6282e027f985
-- 
2.17.1

