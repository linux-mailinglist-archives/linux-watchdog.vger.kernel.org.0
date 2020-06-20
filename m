Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624732025B7
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgFTRuQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:16 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44499 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgFTRuP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:15 -0400
Received: by mail-ot1-f68.google.com with SMTP id e5so9799418ote.11
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EZ87HAZTDdt3n3C9oeFellNh4inXOqJx8U+6lc7QfOQ=;
        b=BJ9R24HYViAnp9paCk61vLoCVDVB8wq0MhANRXPpjyagKgMeyOyq+kOqbgnhnGPLfF
         IFGHEOUfCDi5T01Jd/7XBrryrvLDR/DpoGZDGQFracj325e0pR430X1rGk+ZhBrldL4Z
         b/dc3JxPntgtg3/XScTCOCsvEE6vtyH7O6f3QbB/Lf2MNNcFopteSvXmOI9+JTh1LbAi
         8CVw0ufqVx97lrrR13PMcEW1Z4Tbw1W0C+KfnDn0IU1kNCKAi3lw0PBDEiyxyLeIfdlv
         gzh+yQscCs9H0JNeqDTOogCvewIuOTtE32J4GLpOQxKgl5xsgHuG6ROZ2NJR5MK2fu0h
         gNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=EZ87HAZTDdt3n3C9oeFellNh4inXOqJx8U+6lc7QfOQ=;
        b=IIj2ZrH3lHvEwXtvxHuXT6mcC/jJOnHHxC8WCv05TokEjj+ZiP5BnCfP4fdmVoWn3N
         ztmJZnFUMT+B3vNTY6eU6HYRRBQnjTv59kTfzj33fUYSMpjkFIVkyfBZs3/LweyFRux1
         BdHDWdbPTIFeYT1F1lPav3JVehJIQvfDYEOC5/y5dweE/mXeKpWoVBtjHa5FprpJWxVt
         HMEqphReWPSSRxvKBdspy3ICEkysW0mMiwDVv1AwzlDUMJBLXFVc9WBddAFuBpXbMX8f
         Oow8mHIu0yCa/0dG94Y9ruWakxKngnO3RLpK4dzITl0mgHVk4QbqBxM88HuriXoLfr2U
         FAUw==
X-Gm-Message-State: AOAM5325bJHIZGgwGoshXemQfeC0wIQs/4L/ur4pMvCmaBhpNG3oiLea
        xIPK3OhRPfHlY2tlbNmsTQ==
X-Google-Smtp-Source: ABdhPJw0CbCwMoZvhYI7R6/GLLKwFKpofJQjrF6y4vveqT5NWORBZU3VlHElFB2pRSsN9CvcQOQYUA==
X-Received: by 2002:a9d:f07:: with SMTP id 7mr7610999ott.46.1592675353682;
        Sat, 20 Jun 2020 10:49:13 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id u80sm2003711oia.5.2020.06.20.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:12 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id 7329B180171;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 01/10] watchdog: Ignore stop_on_reboot if no stop function
Date:   Sat, 20 Jun 2020 12:48:58 -0500
Message-Id: <20200620174907.20229-2-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

The reboot notifier unconditionally calls the stop function on the
watchdog, which would result in a crash if the watchdog didn't have a
stop function.  So check at register time to see if there is a stop
function, and don't do stop_on_reboot if it is NULL.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 423844757812..03943a34e9fb 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -260,10 +260,16 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 
 	/* Module parameter to force watchdog policy on reboot. */
 	if (stop_on_reboot != -1) {
-		if (stop_on_reboot)
-			set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
-		else
+		if (stop_on_reboot) {
+			if (!wdd->ops->stop) {
+				pr_err("watchdog%d: stop_on_reboot set, but no stop function.  Ignoring stop_on_reboot.\n", wdd->id);
+				clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
+			} else {
+				set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
+			}
+		} else {
 			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
+		}
 	}
 
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
-- 
2.17.1

