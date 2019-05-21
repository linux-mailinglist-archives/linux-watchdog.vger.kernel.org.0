Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCF28254CA
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 18:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbfEUQDk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 12:03:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38667 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbfEUQDj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 12:03:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so19271344wrs.5;
        Tue, 21 May 2019 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nDVM5JY0UCQQWnTrJayIQkK7SrKOctqqMDMV9spSsxw=;
        b=EYxZgIO5dsxx3yD9fsqj6fe4T+XzTC5VXoGkGvuywXp8yJRU754xsd8K0OEXIy4UCP
         g7WTSgirP243yLYV6r0iHdDyQjtQE9zP7Bb5BNSQoll1ld1h4eBB2i/xrNmezqhql3/C
         nfkGZF04ZpAdquZuprZSg0EOzQFn5b4sA8Pad2z1LwRf5X7OZcVA3hE63IqkRX9dJdqa
         ax2LdGe+7nTI0JUBsgJw1oIaGXKyS4SOGjtpiMb9f+CWQUyRfM7ALbzDKK7a/UuB0Q1D
         hLBwRLokrdeLuI6j+34idK2cpYRzi4SBMtYnMoqlVFGTg96NsFRq9fVt1i3U6eLNCM1e
         BPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nDVM5JY0UCQQWnTrJayIQkK7SrKOctqqMDMV9spSsxw=;
        b=SqGADpYO1NqOLTEKzYbrGPv/nKM9PaMbtnYvHsIy77GVBi0YmQkyQe8uubm9qE0+SL
         bD96OFoY/SnGvANlKcoissKV2FX2YoGWJoY8lrJHY8whG2dC/Y8qEk+7pDP4S92JhqyA
         d3024ryLUJ24k028u3ncxCleAIvyACKdiAsOZdvDgC8jT8w3Ym+lHthHfGQMMuSvXvc0
         WbXzdIsTdgQqzVodTO4fdgqaAi8b7piVYPWLmBsTkx0CAMfZZLAgPzvLMgkOw96DDVqN
         YwjPKbqgtb2URFeQL7WTPcRl8TjNdgnVXQcayhH6oRyECHvyjoEYUc9G7YugElCdcl8e
         SmBQ==
X-Gm-Message-State: APjAAAUnC7adAXP9EcCsuqIO8ezJOMRhlRr6eVzr9Ni1MVQ1N3EL6Bqr
        4J1HOCnwADWK1/GOXlBQSGQRsIDpBlskVg==
X-Google-Smtp-Source: APXvYqw//oVHVQE8dOkatKRTfxOnljBLeM0nGz32xgOKSjeongOCRNazNj5zD0dXglyd7R3Kdi2Jdg==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr52594055wrr.122.1558454617669;
        Tue, 21 May 2019 09:03:37 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id g11sm6853811wrq.89.2019.05.21.09.03.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:03:36 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Allwinner H6 watchdog support
Date:   Tue, 21 May 2019 18:03:25 +0200
Message-Id: <20190521160330.28402-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Clément Péron (5):
  dt-bindings: watchdog: add Allwinner H6 watchdog
  arm64: dts: allwinner: h6: add watchdog node
  dt-bindings: watchdog: add Allwinner H6 r_watchdog
  arm64: dts: allwinner: h6: add r_watchog node
  arm64: defconfig: enable sunxi watchdog

 .../devicetree/bindings/watchdog/sunxi-wdt.txt   |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi     | 16 ++++++++++++++++
 arch/arm64/configs/defconfig                     |  1 +
 3 files changed, 19 insertions(+)

-- 
2.17.1

