Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51C416CD55D
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Mar 2023 10:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjC2IzG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Mar 2023 04:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjC2IzB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Mar 2023 04:55:01 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7D82685
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Mar 2023 01:54:58 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id y14so14859512wrq.4
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Mar 2023 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNx2krEh3GR3v59eA5d/S4AlPBNoFLuljf92QUi2ejM=;
        b=jPm9y4ljsawaBeFj5F7LMvDCBmvdtx6PlXEX8lqzGaeU2EISdGrvg16xrjEaxKbctm
         ZXpvLlrxFqEz/K4lL4+IDYYuJlGdqpamtKdL+0ZEKCZgi5VHi1yww/i5PaozgPmIVu9t
         u9opCPPXJWSPRgJVDrUj51wCqbwphc8jr83Zg2ajc1d5O5cF2QQCbNLRPE3hI075xkcB
         UPEYH9aadgtzLQJbdGXnGux9FqxX4TsqIFMYD6F8/zcO0TZ/L7TSvFMFVYOjMOkCL9OI
         DF5hviMX8ntTkZF3Qv1I6/AUpXqTovgmGZ/XHxo4m3J1pDzfvsDE2dytHJcdsmS0m335
         ShOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNx2krEh3GR3v59eA5d/S4AlPBNoFLuljf92QUi2ejM=;
        b=rIXAWqKnkmRklrH5KEs1RGRcbVgiYXz/E5zeCI2ZHPVVpvq8qZsI8cv7+W1tIzY4Qw
         MazyNoFhHTD4NO7BFDAKYWOcrEWUpKYe1lhsZignil1H+xJfnKdo/l/zmFSOAQMiidaN
         KnD9jwXjUXV+xxuh4IiR1A6++3SHS6WNmLC7nUvuMwbT4dv5Cl2g2wGM1SK80JIqwRaM
         l6mbp+ryKaHxTk8JrFsO5a1C+EpYkjmR+yJ03OuHfjTerwdTr85uhs3UggV0enOgOizI
         KDBRRa5NzFNGe+XzLT9O/G9kfKjW2e3aqUG54GaUzMfObA96lLT4ct40ejKksOeD6rt0
         P3EA==
X-Gm-Message-State: AAQBX9d4yrRWydEKJf2n5X0Epmr+iZjGATxd78IO6qkbfxmaUaWj94D3
        BNxZMhgkvc/YV4Cc8qkwbepsQQ==
X-Google-Smtp-Source: AKy350aFRjNPuJXKKq4EDNBFTYSpZ6D99D0pqfq5XSz7GM1tk6SuQ0SbJ2SfqJYZiRp2Qalm7T710A==
X-Received: by 2002:adf:e345:0:b0:2cf:e436:f722 with SMTP id n5-20020adfe345000000b002cfe436f722mr12998147wrj.64.1680080096741;
        Wed, 29 Mar 2023 01:54:56 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:54:56 -0700 (PDT)
From:   amergnat@baylibre.com
Date:   Wed, 29 Mar 2023 10:54:24 +0200
Subject: [PATCH v3 03/17] arm64: dts: mediatek: Increase the size BL31
 reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-3-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HPwc58g3z+L52Qm0m/2eTO5SapHSsiq1rcTGcyvoHu8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zbGOq1v5cJTzOx4VQqqVcFyWzaznM8GG7ojT63
 4kmPt+qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP82wAKCRArRkmdfjHURZVkD/
 9iniNBwUP4IUKNBTyOt9NBBNewNHRps9eKJnfOy5f4M4IvCGe+FQWglNA2qQcwhWd0QU6W19kFiWWf
 ZnKapDkcntJMvQ+UoCjOMSsx06L6xNyWiJh3gMRjBriWzBAc+3LmqqxUcGnR3Po/uRnEIyzJ5G5Hlw
 CvTXISp9PZR7uM3YlmJU4UGVSZLZ9FW1HTWVWryQI4RgzFDRQwGuRNgLni3E3Stq9BnbTMTLPYhmNh
 DFZn96kdgPqiyxtDX8NzcvVZm1+ZAE96+6Ak8qwz8jHBw+Y4d6mfyjvb/FLc61mNhNp/5NI5iARJ1i
 82R3r9/N2L0bnuZV1mwvoIjCl5h+YYgKyrUqlcY+ZZfw9cBYGsFRQnWVSzm4fUGUY59KcCI49dgzwU
 5S2amSdfUmgyXAM6yYvFEd2PInOBmT8RIOBfzScOrQUeMefOuY+I/GsXWaTa3FrHaCqe/6iHbwhxs+
 gco6rhMS3sDv2AWBboWYU8/6e+NH1PgQeyf+YP4MCORwSW5K8c5Zk/2kKXYRd9fMR6Xbgi4gUAJy3K
 44pxhNPzOJlY4Z1R9RHqvs9YE0ra2t4kUPuN3M2rhCR48FQFBq1HY/iR/d3ee5JvGkUPVuodWOoCtN
 HqEWEBVHwnDq7itKJsmjvEtwLE282wRfJScKpHgKXWghXdXwYsTqOV99/8pw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Alexandre Bailon <abailon@baylibre.com>

The reserved size for BL31 is too small.
This has been highlighted by the MPU that now restrict access to BL31
memory to secure world only.
This increase the size of the reserved memory.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b68aee8f229f..fc7f6d8ae173 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -65,10 +65,10 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
 		bl31_secmon_reserved: secmon@43000000 {
 			no-map;
-			reg = <0 0x43000000 0 0x20000>;
+			reg = <0 0x43000000 0 0x30000>;
 		};
 
 		/* 12 MiB reserved for OP-TEE (BL32)

-- 
2.25.1

