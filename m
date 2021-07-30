Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A214C3DB21B
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 06:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhG3EOR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 00:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhG3EOP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 00:14:15 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E1FC061765;
        Thu, 29 Jul 2021 21:14:08 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j1so13274585pjv.3;
        Thu, 29 Jul 2021 21:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FvBye5rA/i9gJCLB0CYRwCAx++TS4yW2nWLT0eFIDrs=;
        b=LM53Mom3pAe12LlSUSgtZ5ylKfMyFJjf5WMVbBecCzsYqGT6TJwMrbkAGzm5GuglFC
         J5J+NyaD9DARU7gJak+K+kpsn8LgqMus75VKWHz8FdoQaTPJRzUYW/ATfFVPbk6Qht8n
         xw00ZlNgJXoL8dwYgdKd+CUYFsS7uMlyY6SCog/flKzdX/5ktIqytA2KmnRt3q9GH+iB
         2smWWuvjScseZ5auSrwwYY1RcubGLQndhrtJ1xG5RtE65K6q3RMr7kKWMyEXk/BM2Ovj
         uTHFrhYKsCEuyD8yGpziNWPWEvWmcCiz9A95/fM5eqonSjAm/YoCwG+at48mj4keZo88
         KYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FvBye5rA/i9gJCLB0CYRwCAx++TS4yW2nWLT0eFIDrs=;
        b=JIFyt8o1QUGXTkZxxVyapPDlpeUoOLcw9W5jt92wmqy3+G4iFlxPrOahXLRtytl/ab
         Jqrscs4sZSg8oXX2TVf1AUleX7uzghFexd4/roqKYPvOuffLSDvucq3h3XoLarfFCkT9
         9/qLJUNYr0VlBH1HCGiAuM7KY1nGcAOCdCreAeUzt8Z+fLzOhW54/qg7td0rSc0lvepp
         sz4AiSHF7osQ+tnmJZb2Nvh3apRqhoxP9t4SlDubBx60paCLL+YfHzHaaleWGRpljgpS
         TF+fx35boVBIUH0VQ/ANNRQzBVr2zsDRAzqyFDMgsWuH13pUria2/ZcWu1ycfZ+AaRqD
         LpuA==
X-Gm-Message-State: AOAM532zPA/WMTvUysd7xEW68HTt+KAeAe9x6yxVsP82Iiynlf5E8ClT
        sG51tCgmJn4iv2nId0AiDxs=
X-Google-Smtp-Source: ABdhPJxj+dPUybLbzjGkjBAZMwKOW+2eA2JMyK/N7eKR/7OU03jVYZtj58Mg0Tkhs3MQukajGNwvbg==
X-Received: by 2002:a17:902:e9c4:b029:12c:9108:d85 with SMTP id 4-20020a170902e9c4b029012c91080d85mr645895plk.28.1627618448302;
        Thu, 29 Jul 2021 21:14:08 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 21:14:07 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH v4 0/3] watchdog: meson_gxbb_wdt: improve
Date:   Fri, 30 Jul 2021 12:13:52 +0800
Message-Id: <20210730041355.2810397-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

* Added nowayout module parameter
* Added timeout module parameter
* Removed watchdog_stop_on_reboot

https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t

Artem Lapkin (3):
  watchdog: meson_gxbb_wdt: add nowayout parameter
  watchdog: meson_gxbb_wdt: add timeout parameter
  watchdog: meson_gxbb_wdt: remove stop_on_reboot

 drivers/watchdog/meson_gxbb_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.25.1

