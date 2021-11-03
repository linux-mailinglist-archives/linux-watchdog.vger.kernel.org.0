Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB2D444AFC
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 00:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhKCXGd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Nov 2021 19:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhKCXGc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Nov 2021 19:06:32 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DE3C06127A
        for <linux-watchdog@vger.kernel.org>; Wed,  3 Nov 2021 16:03:55 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id t38so3896457pfg.12
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Nov 2021 16:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NS4eT639BOwvF4y/0Jri0aipGFDU+GOyeNwMYhJ1CsI=;
        b=ty211RcINhjstR5hvJ6vOlvNuK2U2UPclVemOWPNOv+RZAnKeJopU68QRFe2L/JRUl
         8hLDX/IT6xv6UQFfBLJEAwwvXgdwfIZg7UBEu+oqaHI1BZNUx3fnTTGpbUV3Wsf9ZUy4
         7miviuW++N0oDU+/ilKbv3A9RXQBqTYTnJ+AHkUqMw9x4s6U7q/iWZg55uuma9Jc+AF5
         00NRbWmxAhmnB5rJwtCEGAjFoZQkplzh0QqClwj1K5VgdpOVRTF9Cnc93VnqKj7XPVkn
         Jq8f0PZ3taqfiQCW+kJb+B5xz35AiXMMwesxd2L1YevFsWcStkK+HPZAX5b70bGCJG/3
         Amfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NS4eT639BOwvF4y/0Jri0aipGFDU+GOyeNwMYhJ1CsI=;
        b=QMVfs3HRdGYndgVjbz0kuPg4lwGCuA6mRRjB4z+CW2dM0xa60QLZNMWxj2wSKCEm3j
         WlWl5qUHbrWkCfJjeozRMkRHzQs5NCcseWhvQ4cK2+g6v4opzfnUSJZoF3+rQHXt47BD
         D7J9LYXL+DjzQmvCTFI1K2P89+FOOmim/yCfD8J7TFv/PNty7VtGPuzOQHlu6lD5jFIt
         73Et57y4Z1UyDd4qyWj+Kv5IxLhRL3zuT4/W97dhtQH/Cj58P3dMwSkM7Gman+zXq0cy
         ik9LeaZrioie7GpWLybf8kv+sO7i2wsEbgjtZmu8SC2BA63qvHJRYn4qJxP7Lt5aXbui
         OoNw==
X-Gm-Message-State: AOAM5323D3TRSlVXykakure956H9evFilzjPtB70yooqAGiIKLCvvkJs
        9W9LEXVIZEY/62ykzcMRZWlwQdT2RWnSNjm7
X-Google-Smtp-Source: ABdhPJz2SB8By8BJklvuj+Exd4PWOudvGfWoAsy72NJgERh9sYTaGsqL7TUqf2f9ujv2zJAok/v6FA==
X-Received: by 2002:a63:6f4c:: with SMTP id k73mr35716833pgc.61.1635980635076;
        Wed, 03 Nov 2021 16:03:55 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id r25sm2584900pge.61.2021.11.03.16.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:03:54 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     Fabien Parent <fparent@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] watchdog: Kconfig: enable MTK watchdog
Date:   Wed,  3 Nov 2021 16:03:53 -0700
Message-Id: <20211103230354.915658-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Enable CONFIG_MEDIATEK_WATCHDOG when ARCH_MEDIATEK is enabled.

On some platforms (e.g. mt8183-pumpkin), watchdog is enabled by
bootloader, so kernel driver needs to be enabled to avoid watchdog
firing and causing reboot part way through kernel boot.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..00bebbb8f877 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -836,6 +836,7 @@ config MESON_WATCHDOG
 config MEDIATEK_WATCHDOG
 	tristate "Mediatek SoCs watchdog support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	default ARCH_MEDIATEK
 	select WATCHDOG_CORE
 	select RESET_CONTROLLER
 	help
-- 
2.33.0

