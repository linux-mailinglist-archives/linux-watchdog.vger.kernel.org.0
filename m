Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CA16CCBD2
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Mar 2023 23:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjC1VC6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Mar 2023 17:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjC1VC5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Mar 2023 17:02:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01739271B;
        Tue, 28 Mar 2023 14:02:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2405:201:0:21ea:73f6:2283:f432:3936])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: shreeya)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D3342660316C;
        Tue, 28 Mar 2023 22:02:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680037338;
        bh=IkBViQkMrsp3U7hL5tvqsx/UtD7E86JvMjAnDOuW9eM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F88qULeTjTL5NdUCnjTdUvOd0c8p4IxUVoDA39dmYM6w29LLpDYXL4GMDPtBObICC
         sMd4JzMRpU+hh7tlK+IvO7nGLxUv7IKBXRzvCKEyhrBzNfPbJwaEnVMVbBb04mrPLp
         qsjKbrlshAzEKWP5mBetROaiSbn+wL84pI0j26zzcJVOt8BNtqrqn6O3l6W7vYmpX6
         0URWP9QBHTyoWfgblCxZNvju8BLUjLSKbdRro/+HQb5w9L6sAGvJZAoM7N1fbpRtcz
         Rb8i2TnnAnoPhKbJq8IY9JmKD8zqe7TvJA0lypQRG5kDQuACvYFxhWy+9KpUtnKhkH
         VSCfio/WrT3GQ==
From:   Shreeya Patel <shreeya.patel@collabora.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jamie@jamieiles.com,
        heiko@sntech.de
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        Shreeya Patel <shreeya.patel@collabora.com>
Subject: [PATCH 2/2] dt-bindings: watchdog: rockchip: Add rockchip,rk3588-wdt string
Date:   Wed, 29 Mar 2023 02:30:48 +0530
Message-Id: <20230328210048.195124-3-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230328210048.195124-1-shreeya.patel@collabora.com>
References: <20230328210048.195124-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add rockchip,rk3588-wdt compatible string.

Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 92df6e453f64..e7a87ce94772 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - rockchip,rk3368-wdt
               - rockchip,rk3399-wdt
               - rockchip,rk3568-wdt
+              - rockchip,rk3588-wdt
               - rockchip,rv1108-wdt
           - const: snps,dw-wdt
 
-- 
2.30.2

