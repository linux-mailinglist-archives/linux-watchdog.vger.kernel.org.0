Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BDD26E94C
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Sep 2020 01:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgIQXOQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Sep 2020 19:14:16 -0400
Received: from mo-csw-fb1514.securemx.jp ([210.130.202.170]:45052 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgIQXOO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Sep 2020 19:14:14 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 08HMe2YO023965; Fri, 18 Sep 2020 07:40:02 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 08HMdXir004634; Fri, 18 Sep 2020 07:39:33 +0900
X-Iguazu-Qid: 34trjq6AHx6wIiLIxN
X-Iguazu-QSIG: v=2; s=0; t=1600382373; q=34trjq6AHx6wIiLIxN; m=QlwT4gNUb1tB5DSaZHG/yP8alKiL8X0jTw0GUaI9RRc=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1511) id 08HMdV52018857;
        Fri, 18 Sep 2020 07:39:31 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08HMdV3D021364;
        Fri, 18 Sep 2020 07:39:31 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08HMdVu8005304;
        Fri, 18 Sep 2020 07:39:31 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 0/2] Add WDT driver for Toshiba Visconti ARM SoC
Date:   Fri, 18 Sep 2020 07:39:22 +0900
X-TSB-HOP: ON
Message-Id: <20200917223924.227997-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

This is the WDT driver for Toshiba Visconti ARM SoC[0].
This has not yet been included in Linux kernel, but patches have been posted [1]
and some patches have been applied [2].

Since this is a SoC driver, this cannot work by itself, but I have confirmed that it
works with the patch series sent as [1] with DT setting.

Best regards,
  Nobuhiro

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html
[1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2020-September/599678.html
[2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2020-September/600578.html

Nobuhiro Iwamatsu (2):
  watchdog: bindings: Add binding documentation for Toshiba Visconti
    watchdog device
  watchdog: Add Toshiba Visconti watchdog driver

 .../watchdog/toshiba,visconti-wdt.yaml        |  49 +++++
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/visconti_wdt.c               | 192 ++++++++++++++++++
 4 files changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
 create mode 100644 drivers/watchdog/visconti_wdt.c

-- 
2.27.0

