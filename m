Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CC5271281
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Sep 2020 07:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgITFSl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Sep 2020 01:18:41 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:42502 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgITFSl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Sep 2020 01:18:41 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 08K5IC49021223; Sun, 20 Sep 2020 14:18:13 +0900
X-Iguazu-Qid: 34treFjs2vYn3NDKW8
X-Iguazu-QSIG: v=2; s=0; t=1600579092; q=34treFjs2vYn3NDKW8; m=kdVt313gdTPCEPKRWrUQ25NcT9Va3B1WnUM79RCVMIY=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 08K5IBR9024943;
        Sun, 20 Sep 2020 14:18:11 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08K5IAP6027861;
        Sun, 20 Sep 2020 14:18:10 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08K5IAve009984;
        Sun, 20 Sep 2020 14:18:10 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 0/2] Add WDT driver for Toshiba Visconti ARM SoC
Date:   Sun, 20 Sep 2020 14:18:05 +0900
X-TSB-HOP: ON
Message-Id: <20200920051807.288034-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

This is the PWM driver for Toshiba's ARM SoC, Visconti[0].
This has not yet been included in Linux kernel, but patches have been posted [1]
and some patches have been applied [2].

Since this is a SoC driver, this cannot work by itself, but I have confirmed that it
works with the patch series sent as [1] with DT setting.

Best regards,
  Nobuhiro

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html
[1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2020-September/599678.html
[2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2020-September/600578.html

watchdog: bindings: Add binding documentation for Toshiba Visconti watchdog device
  v2 - > v3:
    - no update
  v1 - > v2:
    - no update

watchdog: Add Toshiba Visconti watchdog driver
  v1 - > v3:
    - Fix unnecessary split lines
    - Fix negative value check and handling for visconti_wdt_get_timeleft()
  v1 - > v2:
    - Sort incclude alphabetically.
    - Add negative value check and handling for visconti_wdt_get_timeleft()
    - Use dev_err_probe() with devm_clk_get()

Nobuhiro Iwamatsu (2):
  watchdog: bindings: Add binding documentation for Toshiba Visconti
    watchdog device
  watchdog: Add Toshiba Visconti watchdog driver

 .../watchdog/toshiba,visconti-wdt.yaml        |  49 +++++
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/visconti_wdt.c               | 191 ++++++++++++++++++
 4 files changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
 create mode 100644 drivers/watchdog/visconti_wdt.c

-- 
2.27.0

