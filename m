Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740E43D82F6
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jul 2021 00:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbhG0WbA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Jul 2021 18:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbhG0Wa7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Jul 2021 18:30:59 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572C3C061760;
        Tue, 27 Jul 2021 15:30:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id e5so651931ljp.6;
        Tue, 27 Jul 2021 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KjyganLO1+T1+BsiFH38ATXYgnMw9EHISavZX/sGWgo=;
        b=rn/P0mDx0Tq9fAYFedJWMaTmvFZ0af+L5IU/Rp9wxh1IDILdVJCx7qoAlORUlPAQhX
         b2U8WtC6ZQ4WlZcUlYHRZTJ9upy3Kt7qK2nc1+IkdifD14wo32u+tXOiWPD6E7LOVfd/
         D3pQ6ui66x4q0Ex9/YEDZkM+W4+/mIeBCw/U7VfsK+gluKcwr6sfl7MeSjrWAO05lk8T
         lzrHUyXuRp7JxTOjAfe260zVHeEtt9XAVZCBwN49JGGEbRzVIDYjc26aLe2dcybr9is5
         lkhKk4zR5qf2R0pnDcmGm+jVvKqBUdJ1QKw6GXGDvrWcJ2dttwhQo9JawHluzhJybr1g
         4B8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KjyganLO1+T1+BsiFH38ATXYgnMw9EHISavZX/sGWgo=;
        b=LxFw8+ftD70gUt5qtaPyZMP4m7i/qM2JhNTRlWad/mcyJBHj2PeqjwHRJVDcd3NyHm
         6fcytVqhMHzIEVILD65Ev25PqffYjxQ6h5vBW71QDAUnC7jHOUJqpSN9v+vy2VygQwEB
         Q/p9HjtPBE4OwZfSEteS2KvNGUKDh7cKYhk+pzsuDmhHYabQD08g96Llu0dsAv3dLkyW
         82s30uLyVu0w/uLnuRTmY5hT7T5EZ05H7i0P9nfsrYGmLoGFo0XPLjxvcK1IwRFA9S6H
         YaSYcIC0Q07N+RGh4wActf7YbF730Z5/NiZ7owAcwpRmfYzo717e8cJp2X1BJsBPX+4H
         pIXw==
X-Gm-Message-State: AOAM533ogAyjq+OaP+rr/VGvAkuv29NOOPtwifWg1dRvlju631kSbgY8
        IFMSC6H7VvDA5RL+bOYeY+c=
X-Google-Smtp-Source: ABdhPJyiNcXspT5gUOPQNd2CZ7tVfH9/4MGz6epOK38Rx4z0CAs6iOqjXSJPSC0VWNC40DClc5FIzA==
X-Received: by 2002:a2e:9246:: with SMTP id v6mr16743413ljg.175.1627425056786;
        Tue, 27 Jul 2021 15:30:56 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id h15sm406200lfv.45.2021.07.27.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 15:30:56 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 2/3] watchdog: tqmx86: Constify static struct watchdog_ops
Date:   Wed, 28 Jul 2021 00:30:41 +0200
Message-Id: <20210727223042.48150-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
References: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The struct tqmx86_wdt_ops is only assigned to the ops pointer in the
watchdog_device struct, which is a pointer to const struct watchdog_ops.
Make it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/watchdog/tqmx86_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/tqmx86_wdt.c b/drivers/watchdog/tqmx86_wdt.c
index 72d0b0adde38..83860e94ce9d 100644
--- a/drivers/watchdog/tqmx86_wdt.c
+++ b/drivers/watchdog/tqmx86_wdt.c
@@ -62,7 +62,7 @@ static const struct watchdog_info tqmx86_wdt_info = {
 	.identity	= "TQMx86 Watchdog",
 };
 
-static struct watchdog_ops tqmx86_wdt_ops = {
+static const struct watchdog_ops tqmx86_wdt_ops = {
 	.owner		= THIS_MODULE,
 	.start		= tqmx86_wdt_start,
 	.set_timeout	= tqmx86_wdt_set_timeout,
-- 
2.32.0

