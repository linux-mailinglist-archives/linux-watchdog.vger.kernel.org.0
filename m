Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAAE264A02
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Sep 2020 18:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgIJQk7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Sep 2020 12:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgIJQi4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Sep 2020 12:38:56 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D61C06179B;
        Thu, 10 Sep 2020 09:31:13 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id c10so5833649otm.13;
        Thu, 10 Sep 2020 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ZLflO+6y2CV3/36DCXEjAkXxKljpWSRITCgyl2EiC0E=;
        b=h+WxcfKUGurTr1Vg8vZwYENOYIbO1DOxXVl8Xda6agOKRjwLTrSyAgxMznXVpYX8Mi
         CccsFN7kQjAUeB5YIr7unKtqjkw5h/ArbKznGmFNlJ8hYiCeCwClYWFh+EUHv0ATdSzW
         O7vxYexA0wV+sXea809M/UT2QghMMY5dhB1GvjHZZJwltFyCUuY2DfvjvhoQemxhs+sX
         OMeI5MGuF++hiKL0OY1eC0pcr6WxkV4EY78J6f8GlXUJrFUJry1PvY7SkVBz7vdytA3O
         iW6gDpqS/OtQU2NURMBg9xiXuuUnKid1k/x48K1c3Zc3EcfuPuYXUQBWA0IFBTkWGJDv
         mKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=ZLflO+6y2CV3/36DCXEjAkXxKljpWSRITCgyl2EiC0E=;
        b=a5P/vTLY7X6wFJIpDHCtjxc4cFBNiTl2guTLLSu5iNi/XJmyKXpBDfFE0ExWf+hRMv
         1kLlNXZ92Jum3Lfv9HmYRSf5Kn3Fv8TKFdumDDzZooeQ3ro20DZic5jUWCnGni2hYrg/
         pO/zLXh66kY+6GN0Zlut1J3Bus37HQ5C5jri/WfnshcqUhQvtCNGAhKpWzHG3SXvHUYt
         aw2SVQHnzL58l+rlR6HNP18rRN36kc0kXpiV2E83PogdOxbyjH74WzYlmYkDCXOa9yk0
         OLo7ctioGyz53/wiFVtlNgNWLOgPuwBmuIDONEFx4iNE4J0SAHlNs3rcnBzrM9FcSMjJ
         ljew==
X-Gm-Message-State: AOAM531E1HkjbMMRis7m6lB/Ixmzu+YHsvtz5opqJd/Y3Emv5Hcj5XBA
        EhZwE5OJBBc17DrHexS8NIyh8kBpJpM=
X-Google-Smtp-Source: ABdhPJzhynudBwKeLwB1Aj9BrSLpIfKd4RBlv+9wHJEWtWQ/FAL6Libb8a9POXIeNWNMewacJ82phQ==
X-Received: by 2002:a05:6830:1e8a:: with SMTP id n10mr4610427otr.371.1599755472414;
        Thu, 10 Sep 2020 09:31:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d83sm965480oib.43.2020.09.10.09.31.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 09:31:11 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 1/2] watchdog: sp5100: Fix definition of EFCH_PM_DECODEEN3
Date:   Thu, 10 Sep 2020 09:31:08 -0700
Message-Id: <20200910163109.235136-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

EFCH_PM_DECODEEN3 is supposed to access DECODEEN register bits 24..31,
in other words the register at byte offset 3.

Cc: Jan Kiszka <jan.kiszka@siemens.com>
Fixes: 887d2ec51e34b ("watchdog: sp5100_tco: Add support for recent FCH versions")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/sp5100_tco.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index 87eaf357ae01..adf015aa4126 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -70,7 +70,7 @@
 #define EFCH_PM_DECODEEN_WDT_TMREN	BIT(7)
 
 
-#define EFCH_PM_DECODEEN3		0x00
+#define EFCH_PM_DECODEEN3		0x03
 #define EFCH_PM_DECODEEN_SECOND_RES	GENMASK(1, 0)
 #define EFCH_PM_WATCHDOG_DISABLE	((u8)GENMASK(3, 2))
 
-- 
2.17.1

