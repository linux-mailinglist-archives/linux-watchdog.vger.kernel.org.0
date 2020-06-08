Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18941F128D
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jun 2020 07:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgFHFve (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jun 2020 01:51:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:44750 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727905AbgFHFve (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jun 2020 01:51:34 -0400
IronPort-SDR: SDO3rOjTuiyzjY1kYVFo3Gqhw7N4kLyKLPkIWYwiJwSgLSICQfWatp+JHUce1bm5vX0gLRmNgi
 7k8h1B4ShXjQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2020 22:51:31 -0700
IronPort-SDR: q4UWM5gpo1bj1xHZQ8lGy+US97E6M8gea2VCmgVsGo2PCmkzNCR2S0qAPPP4nFFyEQKlSWRzqu
 aJQ7XDZCfsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="313784734"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2020 22:51:29 -0700
From:   Dilip Kota <eswara.kota@linux.intel.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@intel.com, Dilip Kota <eswara.kota@linux.intel.com>
Subject: [PATCH 0/2] Driver for watchdog timer on Intel Lightning Mountain SoC 
Date:   Mon,  8 Jun 2020 13:49:38 +0800
Message-Id: <cover.1591584255.git.eswara.kota@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch series adds watchdog timer driver and respective yaml schemas
for watchdog timer on Intel Lightning Mountain SoC.

This patch series is rebased and tested on mainline linux kernel 5.7:
base-commit: 3d77e6a8804a ("Linux 5.7")
tags: v5.7

Dilip Kota (2):
  dt-bindings: watchdog: intel: Add YAML Schemas for Watchdog timer
  watchdog: intel: Watchdog timer support on Lightning Mountain

 .../bindings/watchdog/intel,lgm-gptc-wdt.yaml      |  75 ++++
 drivers/watchdog/Kconfig                           |  13 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/intel_lgm_gptc_wdt.c              | 420 +++++++++++++++++++++
 4 files changed, 509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
 create mode 100644 drivers/watchdog/intel_lgm_gptc_wdt.c

-- 
2.11.0

