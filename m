Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6461E3F7311
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Aug 2021 12:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240037AbhHYK1b (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Aug 2021 06:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239975AbhHYK10 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Aug 2021 06:27:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EF5C061757;
        Wed, 25 Aug 2021 03:26:40 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 14CAE1F436E0
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     matthias.bgg@gmail.com, hsinyi@chromium.org,
        linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
        eizan@chromium.org, drinkcat@chromium.org, chunkuang.hu@kernel.org,
        kernel@collabora.com, Crystal Guo <crystal.guo@mediatek.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fabien Parent <fparent@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v3 0/7] Add support to the mmsys driver to be a reset controller
Date:   Wed, 25 Aug 2021 12:26:25 +0200
Message-Id: <20210825102632.601614-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Dear all,

The following patchset is a reimplementation of the patch sent by Jitao
Shi [1] some time ago. As suggested by Chun-Kuang Hu, this time the
reset is done using the reset API, where the mmsys driver is the reset
controller and the mtk_dsi driver is the reset consumer.

Note that the first patch is kind of unrelated change, it's just a
cleanup but is needed if you want to apply all the following patches
cleanly.

This patchset is important in order to have the DSI panel working on some
kukui MT8183 Chromebooks (i.e Lenovo IdeaPad Duet). Without it, you just
get a black screen.

Best regards,
  Enric

[1] https://lore.kernel.org/linux-arm-kernel/20210420132614.150242-4-jitao.shi@mediatek.com/


Changes in v3:
- Based on top of the patch that converts mmsys to schema
- Fix typo in the commit description

Changes in v2:
- Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
- Added a new patch to describe the dsi reset optional property.

Enric Balletbo i Serra (7):
  arm64: dts: mediatek: Move reset controller constants into common
    location
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: display: mediatek: add dsi reset optional property
  arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
  arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0
  soc: mediatek: mmsys: Add reset controller support
  drm/mediatek: mtk_dsi: Reset the dsi0 hardware

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  4 ++
 .../display/mediatek/mediatek,dsi.txt         |  6 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  2 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  5 +-
 drivers/soc/mediatek/mtk-mmsys.c              | 69 +++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h              |  2 +
 drivers/watchdog/mtk_wdt.c                    |  6 +-
 .../mt2712-resets.h                           |  0
 include/dt-bindings/reset/mt8173-resets.h     |  2 +
 .../mt8183-resets.h                           |  3 +
 .../mt8192-resets.h                           |  0
 12 files changed, 98 insertions(+), 6 deletions(-)
 rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (98%)
 rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)

-- 
2.30.2

