Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D8394F23
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfHSUhS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:18 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45969 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfHSUhR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:17 -0400
Received: by mail-oi1-f194.google.com with SMTP id v12so2355572oic.12
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=rr7PFA4y4COyKOxB5OU5lFbFTlcHHXX96fkNQiJtv3g=;
        b=V9qsVg12Fy6vR58Tu6ILDoXkUHgD8jWS6NwTygJncRiEEz1/vbuAOC1TJkl+R5gymU
         xApCfFiA9HzkAtsN0Cs85IB8rAS01Rcv/9jIiiyAU5GQFp7RlRxmLvzKhpW87KMt1V8j
         Q3xyMsDzzomRExkhwOokWUbb8jbeqS3PZT35ChmTUJOnCwkrXFk2Ffir/r2q1JLL2ZsG
         2jou54GJG5mYYyb08wQk8TF/Na2gx1tszKj3Q+5VnlHTGzJYgS3ntbMMXIogsokbWWbS
         PMGqYB5Qpt+veT/l1FU34SPDYSzVidP9aQ/HulPCIFD+7ymWiuEKUYTEy3u80gnAds1U
         YPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=rr7PFA4y4COyKOxB5OU5lFbFTlcHHXX96fkNQiJtv3g=;
        b=BPGuBY+mMPAf/EDwQB7b9ODzHoe9KPNb0r6rmYnwM4JvpfmO3PtSl464JEalH9H9/K
         06kqg2FI/ggxVWIc1plLR+fFEfuhtkawQN8G37z91dWUsd7njQELyxriiObuSVktIihx
         tf/gYSuAjbmcb2KlqjNWI0QNMKMY6JsEOx3AVPDCbSSI/Lu80D63QTY+DZmatPnHw6jP
         1vqyMiqilXRyF6lAzWtX/RZW5FFL17pZ9KjIutIoQjB4pWI6RFVDcstNUwLaqGGcnf8c
         gxbVeTB3S/11Yy89G3QyNkPNU+jz7FZ7Tzalt5HgL+6TnrkKjEqxsLy4+iKUMWZuw1ZZ
         459g==
X-Gm-Message-State: APjAAAXEM8uSW+migveWx0sHOhWEKHuLq7ZmU610GL0ovVjygiRTDrbK
        03mXGNbRsiNb7esBDEhiHg==
X-Google-Smtp-Source: APXvYqze4qUnL/mPSHYAlsR3u8GhAPMeHu5jDk4VcTk3hGqiN+n5FeqrfMQ3xu9sNUlsEBKiGC7trQ==
X-Received: by 2002:aca:58c3:: with SMTP id m186mr14804229oib.21.1566247036825;
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id g3sm6293416oti.41.2019.08.19.13.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 61D111805AC;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 4D645302506; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 07/12] watchdog:ipmi: Add the ability to fetch the current time left
Date:   Mon, 19 Aug 2019 15:37:06 -0500
Message-Id: <20190819203711.32599-8-minyard@acm.org>
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

The new API has the capability, and so do the IPMI interface, so do
it.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/ipmi_watchdog.c | 57 ++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/watchdog/ipmi_watchdog.c b/drivers/watchdog/ipmi_watchdog.c
index c8c11a61ebb9..218c01707c0b 100644
--- a/drivers/watchdog/ipmi_watchdog.c
+++ b/drivers/watchdog/ipmi_watchdog.c
@@ -757,6 +757,62 @@ static int _ipmi_heartbeat(struct ipmi_wdt *iwd)
 	return rv;
 }
 
+static unsigned int ipmi_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct ipmi_wdt *iwd = wdd_to_ipmi_wdt(wdd);
+	struct kernel_ipmi_msg msg;
+	int rv = 0;
+	struct ipmi_system_interface_addr addr;
+
+	mutex_lock(&iwd->lock);
+	if (iwd->state == WDOG_TIMEOUT_NONE)
+		goto out_unlock;
+
+	addr.addr_type = IPMI_SYSTEM_INTERFACE_ADDR_TYPE;
+	addr.channel = IPMI_BMC_CHANNEL;
+	addr.lun = 0;
+
+	atomic_set(&iwd->msg_tofree, 2);
+
+	msg.netfn = 0x06;
+	msg.cmd = IPMI_WDOG_GET_TIMER;
+	msg.data = NULL;
+	msg.data_len = 0;
+	rv = ipmi_request_supply_msgs(iwd->user,
+				      (struct ipmi_addr *) &addr,
+				      0,
+				      &msg,
+				      NULL,
+				      &iwd->smi_msg,
+				      &iwd->recv_msg,
+				      1);
+	if (rv) {
+		pr_warn("get timeout error: %d\n", rv);
+		goto out_unlock;
+	}
+
+	wait_msg_done(iwd, false);
+
+	if (iwd->recv_msg.msg.data[0] != 0)  {
+		pr_warn("get timeout IPMI error: %d\n",
+			iwd->recv_msg.msg.data[0]);
+		goto out_unlock;
+	}
+
+	if (iwd->recv_msg.msg.data_len < 9) {
+		pr_warn("get timeout IPMI response too short: %d\n",
+			iwd->recv_msg.msg.data_len);
+		goto out_unlock;
+	}
+
+	rv = iwd->recv_msg.msg.data[8] << 8 | iwd->recv_msg.msg.data[7];
+	rv /= 10; /* IPMI time is in 100s of milliseconds. */
+
+out_unlock:
+	mutex_unlock(&iwd->lock);
+	return rv;
+}
+
 static void ipmi_wdog_msg_handler(struct ipmi_recv_msg *msg,
 				  void                 *handler_data)
 {
@@ -880,6 +936,7 @@ static const struct watchdog_ops ipmi_wdt_ops = {
 	.ping		= ipmi_wdt_ping,
 	.set_timeout	= ipmi_wdt_set_timeout,
 	.set_pretimeout = ipmi_wdt_set_pretimeout,
+	.get_timeleft   = ipmi_wdt_get_timeleft,
 };
 
 static const struct ipmi_user_hndl ipmi_hndlrs = {
-- 
2.17.1

