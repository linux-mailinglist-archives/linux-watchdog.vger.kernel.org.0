Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872492708CC
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Sep 2020 00:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgIRWOQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Sep 2020 18:14:16 -0400
Received: from mo-csw1114.securemx.jp ([210.130.202.156]:46096 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIRWOP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Sep 2020 18:14:15 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 08IMDgrr028511; Sat, 19 Sep 2020 07:13:42 +0900
X-Iguazu-Qid: 2wHHJOhcAqHaqqtrF2
X-Iguazu-QSIG: v=2; s=0; t=1600467222; q=2wHHJOhcAqHaqqtrF2; m=+e83SuaEvc+u1JKStEGOxviBGLalvTecjWwG7h8fLBM=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1111) id 08IMDdHF013283;
        Sat, 19 Sep 2020 07:13:39 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 08IMDdss000631;
        Sat, 19 Sep 2020 07:13:39 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 08IMDdh0010966;
        Sat, 19 Sep 2020 07:13:39 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 0/2] Add WDT driver for Toshiba Visconti ARM SoC
Date:   Sat, 19 Sep 2020 07:13:35 +0900
X-TSB-HOP: ON
Message-Id: <20200918221337.257157-1-nobuhiro1.iwamatsu@toshiba.co.jp>
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
  v1 - > v2:
    - no update

watchdog: Add Toshiba Visconti watchdog driver
  v1 - > v2:
    - Sort incclude alphabetically.
    - Add negative value check and handling for visconti_wdt_get_timelef()
    - Use dev_err_probe() with devm_clk_get()

Nobuhiro Iwamatsu (2):
  watchdog: bindings: Add binding documentation for Toshiba Visconti
    watchdog device
  watchdog: Add Toshiba Visconti watchdog driver

 .../watchdog/toshiba,visconti-wdt.yaml        |  49 +++++
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/visconti_wdt.c               | 195 ++++++++++++++++++
 4 files changed, 253 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
 create mode 100644 drivers/watchdog/visconti_wdt.c

-- 
2.27.0

