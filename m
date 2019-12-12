Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5829711CCF7
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 13:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbfLLMUG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Dec 2019 07:20:06 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:53857 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbfLLMUG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Dec 2019 07:20:06 -0500
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 12 Dec 2019
 20:20:36 +0800
From:   Xingyu Chen <xingyu.chen@amlogic.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v5 0/4] add meson secure watchdog driver
Date:   Thu, 12 Dec 2019 20:19:43 +0800
Message-ID: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.8.22]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog controller on the Meson-A/C series SoCs is moved to secure world,
We have to call SMC instruction to trap the ATF for watchdog operation. These
operations are different from previous SoCs, so we introduce a new watchdog
driver to support this kind of SoCs.

Changes since v4 at [3]:
- add watchdog node in dts, and introduce a new optional property "timeout-sec"
- add dt-binding for meson secure watchdog
- instantiate wdt device through dts node instead of platform_device_register_simple()

Changes since v3 at [2]:
- add SM_A1_ prefix for WATCHDOG_OPS
- remove phandle to secure-monitor node
- remove watchdog node from dts, and register wdt device by platform_device_register_simple()
- remove dt-binding for meson secure watchdog
- use the msec as unit of timeout parameter which is passed to fw side

Changes since v2 at [1]:
- remove useless dependency in Kconfig
- return zero when getting left time value fails

Changes since v1 at [0]:
- add a new dependency in Kconfig
- simplify/add the return operation
- remove useless ping operation when setting the timeout
- fix some return values
- fix the license statement

[0]:https://lore.kernel.org/linux-amlogic/1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com
[1]:https://lore.kernel.org/linux-amlogic/1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com
[2]:https://lore.kernel.org/linux-amlogic/1571983984-11771-1-git-send-email-xingyu.chen@amlogic.com
[3]:https://lore.kernel.org/linux-amlogic/1574685218-31164-1-git-send-email-xingyu.chen@amlogic.com

Xingyu Chen (4):
  firmware: meson_sm: add new SMC ID support for accessing secure
    watchdog
  dt-bindings: watchdog: add new binding for meson secure watchdog
  watchdog: add meson secure watchdog driver
  arm64: dts: a1: add secure watchdog controller

 .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   |  35 ++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   6 +
 drivers/firmware/meson/meson_sm.c                  |   1 +
 drivers/watchdog/Kconfig                           |  16 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/meson_sec_wdt.c                   | 188 +++++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h            |   1 +
 7 files changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
 create mode 100644 drivers/watchdog/meson_sec_wdt.c

-- 
2.7.4

