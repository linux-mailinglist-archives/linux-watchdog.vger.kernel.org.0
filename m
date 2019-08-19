Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3217F94F1E
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfHSUhQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:16 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39288 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727925AbfHSUhQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:16 -0400
Received: by mail-ot1-f67.google.com with SMTP id b1so2941860otp.6
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=iLqG1t8+/PTpNEIjQR2/+lndK9RpJjp57v9VioZj6nE=;
        b=KMc7Ap1MDd9HgzzVS3/sw8iobOtU/GyVO0xF26eMQ1zGDc08ufYllS1CRhujLvvUVr
         IJzUc6YEAgV2KN5DBsca/fvjB8TbABlP2g2Wh/9GdyauYN2nFc6pNdP3+8h1LeZ0e0so
         xuTzZkx7+8vb6ApnXbuJ8Ft/lfpL5Hk0nnvBqReCvylxL92jE1qNUsvnvKvRYKNE+Wpk
         cjU0jL8jD2CworanpR7uu+DPC7GIpj9FS2Zc8qNygdME5PovSu0ibXJwelM+iL+3mqPD
         oPmBUQVuq9GAcZOpdzNUOAoDfmYGJCLNDLPGXy5yJlhh9ebKHRdsmpsLibXNfEo9MVCG
         gYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=iLqG1t8+/PTpNEIjQR2/+lndK9RpJjp57v9VioZj6nE=;
        b=hqrKJpPq2GIJmVsFc9DFBepOvvsNaJ+40yeQrB4qSLYvJ4dexaWyPnuukLK8de/7S7
         EmbakXiHMXSicMSaD6FdNSTs9IHOL2QhrLp5RpD6qXzjUOgarf9ylX8jMKOOpgMRf4Br
         tKts8eT+eF45DcX9eqMMLWamDw6u8VTfMaeIJ5yCreMnKJWDMuea+NHp0JrkbpWTBMG/
         4Zg5OYg4T1D3AcnXHDzphxJxz5dd94WKRtaVa84kHDIrpLuCBOHOh4fs+d52jVVDWYGh
         srLwfJ+/WODczfuJRgSWiUBBKQ/L8BW/D52T0HZLs+PlTv7IElx4yGfmLJa+7pFEe8EJ
         a0xA==
X-Gm-Message-State: APjAAAUqY1qCj1s01y9x2tTaHCR3VkLpngx+mZAK8tWEF3+3S18tj3mE
        lREO79edsdMcUo1GLs8A+Q==
X-Google-Smtp-Source: APXvYqy/+cnQpCKiUlrwnvRuoN/Zjt1X8xscJZhyp82eQfxTBHp5Bo8ixf2Rt8tKnLx33ZEljbCdyw==
X-Received: by 2002:a9d:5f10:: with SMTP id f16mr20636986oti.320.1566247035138;
        Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id o26sm5444482otl.34.2019.08.19.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:14 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id F29221800D4;
        Mon, 19 Aug 2019 20:37:13 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id D8887301176; Mon, 19 Aug 2019 15:37:13 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 01/12] watchdog: NULL the default governor if it is unregistered
Date:   Mon, 19 Aug 2019 15:37:00 -0500
Message-Id: <20190819203711.32599-2-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819203711.32599-1-minyard@acm.org>
References: <20190819203711.32599-1-minyard@acm.org>
Reply-To: "[PATCH 00/12]"@minyard.net, Convert@minyard.net,
          the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
          to@minyard.net, the@minyard.net, standard@minyard.net,
          interface@minyard.net
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Otherwise it could be used after being freed.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_pretimeout.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 01ca84be240f..b45041b0ef39 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -162,6 +162,8 @@ void watchdog_unregister_governor(struct watchdog_governor *gov)
 			break;
 		}
 	}
+	if (gov == default_gov)
+		default_gov = NULL;
 
 	spin_lock_irq(&pretimeout_lock);
 	list_for_each_entry(p, &pretimeout_list, entry)
-- 
2.17.1

