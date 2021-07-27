Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD11C3D82F7
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jul 2021 00:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbhG0WbB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Jul 2021 18:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbhG0WbA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Jul 2021 18:31:00 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85810C061757;
        Tue, 27 Jul 2021 15:30:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b21so600572ljo.13;
        Tue, 27 Jul 2021 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L+E6/1WGpQqvA+EADiDAbiFLjjUPDw0vrRx5au2t65g=;
        b=J78RlBreAC21dntY/Rlam+7rV7dTIib/TfkejglbDCzwFU95TGQC9LvvZYf+yPB/1o
         TgNEt7xHPsE4fibbhOyPN5uV7czPc1I7m+0ox7+pcvQM432BY8eTOZphforbHl+db9Uv
         k/IOECa2uCl0TKn1lu2KoTkeIZ3V0UtvceY+zkBEhhJvvMFzgDpqlc7FQJNVxeK/Y5Fs
         DV1qqpi4Q245SHiYuONl+uV+HG+q2rYMaZ9kTtDNE1pEK/3RmLuEPQ3RJReUNTuOqeyr
         9S2Q3kXdK5nKr9Alqytg6lsW0e230w56oZGYJWFGBwuDYMrw5usY+UzVBxJ3e0CWlGTI
         lcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L+E6/1WGpQqvA+EADiDAbiFLjjUPDw0vrRx5au2t65g=;
        b=ACZ/jlu7wyUOp+IcN4AeaX+Yc0Dy6ptG+uGSx5laBetW7fwGPpcmVZgEwQ34eGQATo
         AMwj3pcjmGZfuEDMxJt5P2x4EDoZM6hToaRV11KacVhiCihZ9Kz+XcrV+qoWOLD5L2C5
         9l6oYVvxcMOYD3Xr8cJgbGLIjnZtfX+an7Ms7sNPINCej02KzJIvJHQehPJSa5Z7JmFZ
         RDcw4syANQ7U9LfDHWfgELiN22r9J08auiMqb6Y9kTqmdlak4QoVgKv+9a4hkJOIMdZf
         XP8GEadP2ltqznucRqoeBADdwRIrK+vZZCBXQ87GIMkyuuSn/sS+hhhJCJSUBFqhQRT1
         FM+A==
X-Gm-Message-State: AOAM532RTJIznSUNv+Qv/jemXoTltbSZ+dAzjJgMFOVPJ9h+A1xFi/V9
        mEBQTtpqCN9W4DS7Brakk0s=
X-Google-Smtp-Source: ABdhPJwgVRm3p1aqRcx5IbMn3SDg97OoSvKcwEwEIc3doDM0yRdZHT5mcbuFuURVvGhFii199E7FTg==
X-Received: by 2002:a2e:9843:: with SMTP id e3mr16633724ljj.498.1627425057984;
        Tue, 27 Jul 2021 15:30:57 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id h15sm406200lfv.45.2021.07.27.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 15:30:57 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 3/3] watchdog: mpc8xxx_wdt: Constify static struct watchdog_ops
Date:   Wed, 28 Jul 2021 00:30:42 +0200
Message-Id: <20210727223042.48150-4-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
References: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The struct mpc8xxx_wdt_ops is only assigned to the ops pointer in the
watchdog_device struct, which is a pointer to const struct watchdog_ops.
Make it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/watchdog/mpc8xxx_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_wdt.c
index 2f7ded32e878..1c569be72ea2 100644
--- a/drivers/watchdog/mpc8xxx_wdt.c
+++ b/drivers/watchdog/mpc8xxx_wdt.c
@@ -118,7 +118,7 @@ static struct watchdog_info mpc8xxx_wdt_info = {
 	.identity = "MPC8xxx",
 };
 
-static struct watchdog_ops mpc8xxx_wdt_ops = {
+static const struct watchdog_ops mpc8xxx_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = mpc8xxx_wdt_start,
 	.ping = mpc8xxx_wdt_ping,
-- 
2.32.0

