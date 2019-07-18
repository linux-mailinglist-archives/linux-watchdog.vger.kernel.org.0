Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5726D16A
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Jul 2019 17:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbfGRPw4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Jul 2019 11:52:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34370 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRPwz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Jul 2019 11:52:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id b13so12830051pfo.1;
        Thu, 18 Jul 2019 08:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oohisSi7J471LAwyLN/lEHYPf1816pDxaK6cMg+thfk=;
        b=KlX/qeszoT+vixCBkQhynFUGPtr/9hQ0nDg8VDw1l3Zcswkj6scLZAGoXhKH/jSic4
         Z8vq6NGud/R8P08WaR/FiTgpRGChwaFGFNukl0kNxhE6/VZPIhM/T/ReDpKa9JkPce7E
         N6y9jJxDoKCJbggBuFvl555GxepSKn1KhlS93yWgz2BfhUcpgNHS+15KeUZK7SpWMNP0
         aSTTMq8ImIvKMJamJ5ZpGVXzUEpHfKNY0wsKXVYOodWoWdPngVTA1TOygPmlGZbHirmg
         2zVaekTOOHoec1SHh2zhpmRjKIl1j6lGTQhMYVbCYdjnGxd9pOKVWI6FVQ2it+XybzqZ
         OwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oohisSi7J471LAwyLN/lEHYPf1816pDxaK6cMg+thfk=;
        b=aszxCFZ750XK1q6LpkyHly2nw0zE4oaYlpZblV2EpZInqUlBIwClLLeXrDP/UK3WQ8
         5skVxhgduQydq8woZ8mKLS4g3pRgiBydmbwO4HnyGURd/yrzN1YAIvd+icESjHE1Rpov
         dUbw0OJoK9nUnQ2EJLdqWzz+2z5akzzJkaQzMNGJBgDWuG3yM2Fzk7Dj6mnGbv6taKvn
         CD+zbZuayz9WAUpLeIOHou7VKFEBBJffXclnaCefNkZ/YzbYZhWkJ94r8NcD+40BvpY8
         CWfSlAUzH1LrblHLNVfBWmP+SlAazVva90J/dVRmf/jBAbd5MYDTOef8wYrd7YSDMM2s
         Wv1g==
X-Gm-Message-State: APjAAAUJ5IUYzmMIccIeFQUBWc+GRiFdooY3YMadyc4jcdcsrHPBZpo+
        vMFsdCgIt0ozBGxYPyA+bI9in1U3ezD+4A==
X-Google-Smtp-Source: APXvYqxjwjWjE0DuSDDmh9AWYidB6XsO2kxTbL+/yWH3pPEiIiZwcAOGX8aLN+p2UX9YMzy6tE1sig==
X-Received: by 2002:a17:90a:1d8:: with SMTP id 24mr52512118pjd.70.1563465175141;
        Thu, 18 Jul 2019 08:52:55 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id cx22sm23050527pjb.25.2019.07.18.08.52.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 08:52:54 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
Cc:     mbalant3@gmail.com, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Andrianov <andrianov@ispras.ru>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer() concerning ali_timeout_bits variable.  variable.
Date:   Thu, 18 Jul 2019 08:52:38 -0700
Message-Id: <20190718155238.3066-1-mbalant3@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

---
 drivers/watchdog/alim1535_wdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/alim1535_wdt.c b/drivers/watchdog/alim1535_wdt.c
index 60f0c2eb..4ba2b860 100644
--- a/drivers/watchdog/alim1535_wdt.c
+++ b/drivers/watchdog/alim1535_wdt.c
@@ -107,6 +107,7 @@ static void ali_keepalive(void)
 
 static int ali_settimer(int t)
 {
+    spin_lock(&ali_lock);
     if (t < 0)
         return -EINVAL;
     else if (t < 60)
@@ -117,7 +118,7 @@ static int ali_settimer(int t)
         ali_timeout_bits = (t / 300)|(1 << 6)|(1 << 7);
     else
         return -EINVAL;
-
+    spin_unlock(&ali_lock);
     timeout = t;
     return 0;
 }
-- 
2.17.1
Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
Cc: Pavel Andrianov <andrianov@ispras.ru>
Cc:Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE DRIVERS)
Cc: Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
Cc:linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
Cc:linux-kernel@vger.kernel.org (open list)
