Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99673223D3
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 17:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729289AbfERPYE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 11:24:04 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:33798 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfERPYE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 11:24:04 -0400
Received: by mail-wr1-f48.google.com with SMTP id f8so3617252wrt.1;
        Sat, 18 May 2019 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f2Vajn+WWPZ6MItypnKB1zIVfCo1eg6EMXVoRfUSJVM=;
        b=P1f/xHK9z2ASDeMG8Rzksn0vI1MGfuEQXGKk3710zKCYHxOYESPUf73r6VwYnjzbTk
         1o/TSTXo0NtMUmJWcyuX2eeOErUp6aomh0v/X2+X3RA+ZdgU9QpQV7oahfjAvufOu29V
         DuPSygnxL0KH+04sJpqmsWEAQZV2oXT/xd4hkQYDHR8RYg4NsUBhsu6sHf2goI6srsdC
         2IlabTPuksycgJ6cMvFRhtkkS5ioRs4ayZKquE+zUmgKuCcTGnVv3I6x/jTMrjMUkJYo
         jz/6/5TRH9AUE9AiTw8w0OsvIaoxzUasblbdmTCz6e6Ugn74YoZC7+dDK3lxwbdPjhVn
         +NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f2Vajn+WWPZ6MItypnKB1zIVfCo1eg6EMXVoRfUSJVM=;
        b=NbTLBlQWBe0YekQ3CByIVgNiT9ouvz/nh0pqwqgwf5x5h7ITSSazncZcWPHLO+Wn8Q
         pbhqKUBky3nFT1GbjOuWse3PGrqQS4viIYMvhJjglVEj+xzyedbSv0Dh24STtZNwr7b8
         T15HYlif1JIz52SZV/oI3WQ2WhhX4FdsXvsFTh+ihMv/DvRLOhd+YpDAPZFKlU4LxPEs
         zVISEE4EoxR4GCu63cGYnZ6uwWdC9LKwgih04iva4yAqJsaudrpZj52pXX4m3Df+O0l2
         IDIFFyAKKBpXqMF0ocyCZ+f9va1RgQHR11G5mV6SLppGhS/uW9C59V0avTqT1b1lEbXO
         HA4g==
X-Gm-Message-State: APjAAAUd+5KRdTgcHSn74ND2Q0WTYf41uhWwgSf8dWWC+l2jwt2SsFdu
        vOwKW7P+JNGRW/9uVt2OgTQ=
X-Google-Smtp-Source: APXvYqzsDebP4qfKcCv/S2MxLOaouK3ST+Az6tGNP9Vg56BOffbfysrpOufFkiafcP3Gw5Nk90jQBA==
X-Received: by 2002:a5d:468b:: with SMTP id u11mr1787944wrq.276.1558193041864;
        Sat, 18 May 2019 08:24:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id j190sm12934836wmb.19.2019.05.18.08.24.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 08:24:01 -0700 (PDT)
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
Subject: [PATCH v3 0/4] Allwinner H6 watchdog support
Date:   Sat, 18 May 2019 17:23:51 +0200
Message-Id: <20190518152355.11134-1-peron.clem@gmail.com>
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

Maybe it would be proper to introduce a "allwinner,sun50i-h6-r-wdt" bindings?

Thanks,
Clément

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

 .../devicetree/bindings/watchdog/sunxi-wdt.txt | 10 ++++++----
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi   | 18 ++++++++++++++++++
 arch/arm64/configs/defconfig                   |  1 +
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.17.1

