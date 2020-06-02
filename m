Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6933E1EB4FD
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Jun 2020 07:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgFBFVQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Jun 2020 01:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgFBFVP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Jun 2020 01:21:15 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A734C061A0E;
        Mon,  1 Jun 2020 22:21:15 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n24so11472802ejd.0;
        Mon, 01 Jun 2020 22:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8MzhGFpvwa3UfXHYcRPsEGkWRSqJ2Iw6pEALuEOQqkE=;
        b=H7FzDG0JwgG/2pH1MrAAwYpycYFTHKzyMni1BuTKXn8qcaFxMk2NxfmD5v2tN7m0yu
         06lVhvSbSV3+kCHvfED1hVSLHu6jE54FoQyNYhWoiulZD6wE8kqi/wDaMpB18f54kOGS
         KCnBjHpbYyt62Id7AKefASLUJWL5z2lZNPRmNnroIAjZeCAWsXFTvWinNir8rTKRx8bs
         Tf1py3P/zhGrhJwPd0VRvOgRu1JF6BkqVCKyoYtxJuzolDhMRrqF0nVFQS1yra+WMUyC
         B164aIqxs2fZ9uscg5zpwPcH7WY9Hrsq48rrStfqYtvF6Up5d2GziSpstir/6siZL5cs
         3bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8MzhGFpvwa3UfXHYcRPsEGkWRSqJ2Iw6pEALuEOQqkE=;
        b=EV5LHb33CQGqo2Ajqn3oG+Mg0lbU0aEpXETbW+zH3Ayrt3iOzfbngan8AHOlCwIdvh
         0jem3Byj1so8lzd0cAdVGBFeJGTwNWC+K+vKspOGzPMMRi4kw/3v8/P8pVl+XKR53GUt
         2WsvrWQd1DtAnpvRinkrbM63wkPJZAZhFNatIFytt7oGqSoJ8ySgUZRiInA4LQJKgJPu
         JxJs22mhjI3P1UTEEcWPeE/Dv/rdwMyCnGyLqtIlSGXMupH5+ygoUcmiR7+nLy1qCLPp
         zs+20RiSbTt6ubfq8yCFaSo/fkRPO6IbaE2FOv8MEOnpIWyEJZLh4zF2fgk4946epWgF
         /n0Q==
X-Gm-Message-State: AOAM533YqRcISTpAKI8Hp+q7DbhYojNMm2SL4BP5aNCCWcNVRDgmpfiP
        WRvJMeGqNoSZXysbAUlrgZE=
X-Google-Smtp-Source: ABdhPJwEJtJjHtnjQTurvhRnMv4L0axzw7MUv6dHx4TtBwbTsUpo6AqwjzJ1Mia58QfXBAgo7esmmA==
X-Received: by 2002:a17:906:2e1a:: with SMTP id n26mr21516079eji.425.1591075274098;
        Mon, 01 Jun 2020 22:21:14 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2df2:5300:959a:b3cc:b169:a3f0])
        by smtp.gmail.com with ESMTPSA id dh22sm964480edb.94.2020.06.01.22.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 22:21:13 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Julius Werner <jwerner@chromium.org>,
        Evan Benn <evanbenn@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
Date:   Tue,  2 Jun 2020 07:21:04 +0200
Message-Id: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Commit 5c24a28b4eb8 ("dt-bindings: watchdog: Add ARM smc wdt for mt8173
watchdog") added the new ARM SMC WATCHDOG DRIVER entry in MAINTAINERS, but
slipped in a minor mistake.

Luckily, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: devicetree/bindings/watchdog/arm-smc-wdt.yaml

Update file entry to intended file location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Julius, Evan, please ack.

Wim, please pick this minor patch into your -next tree.

applies cleanly on next-20200529

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b045b70e54df..dcfb09700b96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1489,7 +1489,7 @@ ARM SMC WATCHDOG DRIVER
 M:	Julius Werner <jwerner@chromium.org>
 R:	Evan Benn <evanbenn@chromium.org>
 S:	Maintained
-F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
+F:	Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
 F:	drivers/watchdog/arm_smc_wdt.c
 
 ARM SMMU DRIVERS
-- 
2.17.1

