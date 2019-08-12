Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBBE8A811
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfHLUJj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36900 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727758AbfHLUJj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id 129so3332740pfa.4;
        Mon, 12 Aug 2019 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fEQpbh35kmetbOwWrx+8yJXAYsmEnojnvAEv4480YIA=;
        b=X+pEynRi2mvcOZjNBWuJ/XWBTcZPw8Wnkx+NVbZtAK0OmaiCpAIqGzB0YIY+y6IkQf
         jNvFwvw7rdsXL/LEmf+t+HVeT4TfCAWukobpEV6BagJNiFZJ9v9W/pMAGuzXhd8zv6m/
         UwW8NXVUEt3aWPkyU1lWpbqi+/4oq3dE+Ig74tTmgegA+ZM5IVHOcDRWJZR0xd/REMv7
         OQiD33BmL1qYhoC8qiBSxCA6wnETr21KysxoLxfgb7YnTauNtOXtdvqQ8lhqVGsRCRzW
         dKdbiikmKcI6xLldRANuGsxhW66t5PNro+gI5S2ZVFbLCzUIkZjslOY/CXrx/LuYDjpc
         3R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fEQpbh35kmetbOwWrx+8yJXAYsmEnojnvAEv4480YIA=;
        b=owuaY8FljkmCYgx89D7oWNaLe4tB2rPu7AqupTKU3P5JQ6s+8MllNn03OryVO7S3GR
         PYQiWndL/5gXE4pBUC4Vbc8nfUXxGeBNQRCwQtlB+ELqQApwsgv213br+RVHh+Y3BhUW
         UQbHsHNfdmWY9urNHkXgmWxlGupyN87qNMS9bGnSsS9g8mZVf5El0xPdfitZFrupBMgF
         zbGj3BsD+QgJVLlyjT5j+XRdLvVDmeP6eyU2enLZiiGlPKSr52Jkg9OIygssCLYCY8NW
         kDaC+FYbglAR53GQTNo9igD0TuZaqrPrCh79qyNAp/KbmY4dXwSvBCvfABPHFkQKPeQE
         CJSg==
X-Gm-Message-State: APjAAAVRJfRRyRCzCtvCIsJLqI414oW+s3IjCq2H1Nm/c9Fk2m0OZ0VQ
        oX/MR2cdockXDPkEABOHsZiL9xa6
X-Google-Smtp-Source: APXvYqxA1gL+MXZ4IG2JLjwA/6cNQ/lJsRKvitucNa0eGKGYQIz0jr8UIIEH2fzdQQ8BZKq2qLtrBQ==
X-Received: by 2002:a65:6114:: with SMTP id z20mr32068911pgu.141.1565640577821;
        Mon, 12 Aug 2019 13:09:37 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:37 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/22] watchdog: ziirave_wdt: Fix misleading error message
Date:   Mon, 12 Aug 2019 13:08:59 -0700
Message-Id: <20190812200906.31344-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix misleading error message in ziirave_wdt_init_duration(). Saying
"unable to set ..." implies that an attempt at communication with
watchdog device has taken palce and was not successful. In this case,
however, all it indicates is that no reset pulse duration was
specified either via kernel parameter or Device Tree. Re-phase the log
message to be more clear about benign nature of this event.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index a3cc936858ad..0c150f3cf408 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -603,7 +603,7 @@ static int ziirave_wdt_init_duration(struct i2c_client *client)
 						   &reset_duration);
 		if (ret) {
 			dev_info(&client->dev,
-				 "Unable to set reset pulse duration, using default\n");
+			 "No reset pulse duration specified, using default\n");
 			return 0;
 		}
 	}
-- 
2.21.0

