Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3361C8A829
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfHLUK2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:10:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34136 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfHLUJc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so43814328pgc.1;
        Mon, 12 Aug 2019 13:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s6xPb3Pi9HQl3OaPyWVe4AATOniA65kRVZILYWuETVg=;
        b=Tl5W5sCmCDdiZk0cvEElfwNZ8muz77OEpGZooh6sxP2+mjyOpyYqbUq9lXFAbvuJLc
         jqYjTc89PwWzm9Lk+wtDKOrB8lN6ek2lBL6PoK+oIs2dd6d7Os9VVSruHjG4hWSdCMU4
         ZBN2e5ASSuJWF1YdWFl4GuvHqE9revKIbp3uGxGEWkpwiAGyZ+8FyxnfnERnGHP8Jz6q
         iMBGjb8RRcbMZnc7DbFA8yfdUfDzFuzkYS5s4UFs/azwJObr/DfZSBI/Z3VIPBSLGFKi
         P2oHDUHmvZE7OjAwQ9YAoQvUquTbSXf1u7nhy/qQjvFSFw7gcHwBCGU9BMFcG8eeal6h
         FRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s6xPb3Pi9HQl3OaPyWVe4AATOniA65kRVZILYWuETVg=;
        b=nfphnRBXhOrUdLnhX3SEk74BV7Cd+nxK4Q2PhJ+Cv4tpTUTePCTaMZY4xdm7v+4g+Q
         uZeR6UOOl84afkayzr2DymV1I7DEGlQm2cGZgkhIDH61E7XOY/Ox12mZEy3LGD9OnZ6w
         Qy3RwXiBZ26g3XbEMOkGALW92tf+t9pB1eLpgyVRPXcn6t4rHFf/AESXgDUOemzzR0ic
         e+ilO1/Yd+azZKzpwUZUsNRtr04lnR7oM8Mi6yzRePLcwGnYZniWHgcKpX6WWImqcXXE
         LgJYi4IdzzMyaSeMNUOu+9/nHp8l9gw234o9uNSQ2Wgx/eK0KSJFCi4uwjJqW95RqiXR
         bKuA==
X-Gm-Message-State: APjAAAUbsuV5c8XawHGwHB545/Ofkv/YJYo/tz5EYJRPq17m+a0hl9t5
        VWarOwFzCL3YImNxHjs0GCpQ0wJs
X-Google-Smtp-Source: APXvYqwGM/Yr0wf0FOouYw8R3GOXH4oT1nkm4wRNA+S5UsJlHqGQ+/tUp+XuUh8+IwQVFMuMFNPJAA==
X-Received: by 2002:aa7:9254:: with SMTP id 20mr38477100pfp.212.1565640571617;
        Mon, 12 Aug 2019 13:09:31 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:30 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/22] watchdog: ziirave_wdt: Zero out only what's necessary
Date:   Mon, 12 Aug 2019 13:08:54 -0700
Message-Id: <20190812200906.31344-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Instead of zeroing out all of the packet and then overwriting a
significant portion of those zeros via memcpy(), zero out only a
portion of the packet that is known to not contain any data.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index e0f55cbdc603..69694f2836d7 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -260,8 +260,6 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 		return -EMSGSIZE;
 	}
 
-	memset(packet, 0, sizeof(packet));
-
 	/* Packet length */
 	packet[0] = len;
 	/* Packet address */
@@ -269,6 +267,7 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 	packet[2] = (addr16 & 0xff00) >> 8;
 
 	memcpy(packet + 3, data, len);
+	memset(packet + 3 + len, 0, ZIIRAVE_FIRM_PKT_DATA_SIZE - len);
 
 	/* Packet checksum */
 	for (i = 0; i < len + 3; i++)
-- 
2.21.0

