Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59D894F20
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfHSUhQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:16 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45967 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbfHSUhQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:16 -0400
Received: by mail-oi1-f195.google.com with SMTP id v12so2355523oic.12
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=JX68BlRG1YFE+L+0xwopCCOIywBef5tbpEIb1SAdao8=;
        b=oNM5q18guIaPGkRgMbjx8gUWbMGsNCcCSxln0CIEQsbCtQfdQjyyamq8BsFFOLvWeY
         q/IR95jM3SuAR1quTaqPzr6OxQ6tYuR++O57QEXYtdxJfsnc3EcupJlbc7Z3nLxLsUce
         RLxstz+NJod84WV+kz0jDqSO+jjtSPUkGdWWKLTwcKgd31c8q783wzLIl4wvo5lN4yiW
         cA2Kro6w0U0Lkc4+IVUc8aPxLhwTzk8uDKnMPzH4aMmK3b8KNFzzDxU9us8W/3ZrHLFs
         EzIu7YTN4S/Rh4feeue4nBnsXk+qUzmYoN2RyvySU/T/7Fcrv0AvW1qYFAIpJnWi6usz
         /mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=JX68BlRG1YFE+L+0xwopCCOIywBef5tbpEIb1SAdao8=;
        b=PGanL/LT41pxdnPCHlBUnL0UQpM5U4PD4DJcKZ4L9IukECfDjEn/DKkgziZ5RKd9Ju
         0b78LmP4XnkngkEj0Sd5sn27XhP8+9GGfA9SiH9YzZ2kwfm7KEgFumIqV1LHcOuMrysb
         hhFkeifTwjhtqyVYeIHuJVaVpVHWwCcA3gNSYlzIq4j3EKkm41dHDJFPPIO98lL6Y2XF
         g1PU6TQWM97KvZIMXUJ1MRVMELvNe7Ea8AJ6kyCcD+ykn1xTY2OELrDaO+A1d+QFfem+
         6EEFjHre0lF+aXnuBkrVJ71MWoZ2aPdgrPAqhKPBrC2g9ypRN4+POnkbpsFE5eUVbTTf
         qsgA==
X-Gm-Message-State: APjAAAWx1VeOtiaaxeHtAwAqTcOiAbElIkdh8ZMDgd1i7gJVXq0bnhLf
        RoJBQ4wydxS3c5vjVb8mPA==
X-Google-Smtp-Source: APXvYqyMs4FfzFOEKYIrPIySec1MbW+7jBfsphBoMB54GtWTXIRP4taK8K5iOhuc+/dG6WR2oAY9mA==
X-Received: by 2002:a05:6808:92:: with SMTP id s18mr13962838oic.141.1566247035638;
        Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id k24sm4256706oic.29.2019.08.19.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 3EDA61805A9;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 20032301220; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 04/12] watchdog: Allow pretimeout governor setting to be accessed from modules
Date:   Mon, 19 Aug 2019 15:37:03 -0500
Message-Id: <20190819203711.32599-5-minyard@acm.org>
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

This is so watchdog driver (like IPMI) can set it.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/watchdog_pretimeout.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index b45041b0ef39..270baf7b3fa0 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -95,6 +95,7 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(watchdog_pretimeout_governor_set);
 
 void watchdog_notify_pretimeout(struct watchdog_device *wdd)
 {
-- 
2.17.1

