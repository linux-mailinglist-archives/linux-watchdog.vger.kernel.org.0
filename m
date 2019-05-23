Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 019FA280AE
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 17:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730782AbfEWPK6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 11:10:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46002 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730756AbfEWPK6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 11:10:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id b18so6665197wrq.12;
        Thu, 23 May 2019 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lG50LjNdtMd0GMcXEgVx+Uoijbx7K9hNxSLBW/EgKhU=;
        b=ldNHsFevoUJI+m4FbTi2UMH8wljD73iVyxptd+ijSL15+l+rvV27f4AhOfD6Zithsz
         WHb2N7G1npz9JSFRbdGPfYOgGBC0e9w0H9CXu1nBFbBWtdq43KJ+vRiBbMmpxNw9KI4S
         Aep6RVyaD/KsRv+ZWnTUzNufFG+S8xl+kI8jsyzurpZGX262YD6X/LM6Hwe1FT0zDZXU
         SKQeh+duhFV4XN7daCUxIws7h8BRcEK3oGdbGeAJblBk/DV5iFfMf+TJAnpzMNzmokQP
         rbhFXAqrhe3S1YPlLEklIZ7ksp7mHOESuCYvGE5DJiGKehx2Ifyo5fOyiYFAXuRrF106
         aAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lG50LjNdtMd0GMcXEgVx+Uoijbx7K9hNxSLBW/EgKhU=;
        b=Bqzhz6fMEoOC+nSzSGddgW9jAwV9MJOP3N+JxS/FC/+6LLktL2BVZ2HF49qjfyRSrB
         a/DG/+K6cPnQgpApU1YOaLs4a290Fhncw41Up1ETy30GozXE/A6T2QAqqi1N0aQ2C8wT
         /QtLazp4C0wSk5oHg1N+sLj10T/MTIO7nkv/Ncr/c4qJfxIIzIYn8/bytBiTjtH0WYtJ
         2Kp3QaQwz7AhUuNGJuYsQ7sf53Al2nDRv+y44tbv8195LJhw5UCj/tBcr/Jvdi3eSQl+
         nBiU/pJfoHlQ/VxRm0byEWjywx6Et3gZd4aDPlt0rsJDEsdXNSfmp42OUrtxYNLCroNY
         Zsjg==
X-Gm-Message-State: APjAAAU25wD6sX2esBLb7x0dKCgHuLqb0MFswPBLAAf/Os3ggjqrYH9T
        RFj7aC5OfBtSQAPEFOeNE2Sx2xTTlUZngQ==
X-Google-Smtp-Source: APXvYqwCg24QiXYaWltw5JOWO6jVdtF8z8XW5AMyTqUcKape8p/MJ1d+TsrXsWEg5OIeBmZrAPWruA==
X-Received: by 2002:adf:cf0e:: with SMTP id o14mr3337336wrj.230.1558624256003;
        Thu, 23 May 2019 08:10:56 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id q15sm11436324wrr.19.2019.05.23.08.10.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:10:55 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 0/4] Allwinner H6 watchdog support
Date:   Thu, 23 May 2019 17:10:46 +0200
Message-Id: <20190523151050.27302-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Allwinner H6 SoC has two watchdogs.

As we are not sure that both A64 and H6 are stricly identical, I have
introduced the H6 bindings.

After investigation it seems that on some boards the first watchdog doesn't
make it properly reboot. Please see details in the commit log.

I think it's proper to add it with a comment anyway.

The r_watchdog is still available and usable on all the H6 boards.

Thanks,
Clément

Changes since v4:
 - Delete specific bindings for r-wdt

Changes since v3:
 - Remove A64 compatible
 - Introduce specific bindings for r-wdt

Changes since v2:
 - Reintroduce H6 bindings
 - Add watchdog Maintainters / ML
 - Add Martin Ayotte test results

Changes since v1:
 - Use A64 compatible instead of H6
 - Remove dt-bindings patch
 - Change watchdog status to disabled
 - Add r_watchdog node patch
 - Add enable sunxi watchdog patch

Clément Péron (4):
  dt-bindings: watchdog: add Allwinner H6 watchdog
  arm64: dts: allwinner: h6: add watchdog node
  arm64: dts: allwinner: h6: add r_watchog node
  arm64: defconfig: enable sunxi watchdog

 .../devicetree/bindings/watchdog/sunxi-wdt.txt   |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi     | 16 ++++++++++++++++
 arch/arm64/configs/defconfig                     |  1 +
 3 files changed, 18 insertions(+)

-- 
2.20.1

