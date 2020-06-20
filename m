Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151282025BF
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgFTRuU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40856 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgFTRuT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id s13so9825840otd.7
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hefERlK9yzc5CtOHMeWDFbrpyx2QYZAM6vVP3l6xCsg=;
        b=atLroCGWinBkvrb3T5yRnPgqSkKBeSFPrcGESGU4p2nxI3Wi604hHHLiQGT4fEd9KG
         FFPp5yQ/XjMjqm8+U0OGSSap6PaGHUDIvAA3vrA8kFUo/YPFTFmRKjE4T66kWNunOWHM
         AaqbCdCT4or44ixpTJkBUnoDjNrav4BieHTzy8yBEmW3zw9WAl2BaFxeUvJemBvsrCBX
         bilkTnCsdW78E+pzvVi69a3NuavfCEe6bXji4Bn9vj04LlWnYSfIctWIiAzTyvAWxkkg
         94whV4R753iUhHb0y99IjL1h2Nl1t8UDdPSE7PYqoyymaQRPAVtrtFr406N3h4E149D+
         ufXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=hefERlK9yzc5CtOHMeWDFbrpyx2QYZAM6vVP3l6xCsg=;
        b=AW1q7Dvs3pWpn9w+VMozceaTArmcWO2ZamPOOxhivI25ukE2XeAgBtXGDaOJqKPy9x
         mwI94VWDZy1wzIJ1y/llcgy5V7fYFblpm4lA4Na7WKOpPnPVWS3QHcYZP4sr8MbCDduu
         qSrJzJvLiIXHHJfFx/D5VT5rUbnUQ997M61hacatS8HqA52aNL0oanuwbms2CfpL1tA3
         B83onVxbwu5ek7ILDd30CGaMB39AJKMmefhQPiQj7C7es9L35JqqIj/71B1dyUtpAwd+
         snj/6a8PG92IPadboCJyE92fe8qk05mMgBx2R+YQ6wzqF31iG3cvKohAUZdBtL1SBodB
         PGBg==
X-Gm-Message-State: AOAM532gr/2+d3/cDc+Lxoi+dg9vwHjyhtMejwPZczqqPJrBfH+gQWa9
        b8og62CyhiKZ1s34FnlMxQ==
X-Google-Smtp-Source: ABdhPJxeBJV//BWq7JXywLUk8nJ+oQ+i+2IG1zpPMIltz5PeDq+20KyJXMz2SdNG+qLsLgiw6MQvdg==
X-Received: by 2002:a9d:6e03:: with SMTP id e3mr7319039otr.71.1592675357625;
        Sat, 20 Jun 2020 10:49:17 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id d145sm713512oib.17.2020.06.20.10.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:15 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id 1A622180566;
        Sat, 20 Jun 2020 17:49:12 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 10/10] ipmi:watchdog: Add the op to get the current timeout
Date:   Sat, 20 Jun 2020 12:49:07 -0500
Message-Id: <20200620174907.20229-11-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

The function is there and it can be done, so add it to round out the
functionality.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_watchdog.c | 80 +++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index 1ee884e6dcac..e0dd820af3a9 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -722,6 +722,85 @@ static int ipmi_wdog_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
+/*
+ * These are for fetching the current watchdog timeout.  We use a
+ * separate set so we don't block a time set when getting the time.
+ */
+static DEFINE_MUTEX(ipmi_wdog_get_mutex);
+static atomic_t get_msg_tofree = ATOMIC_INIT(0);
+static DECLARE_COMPLETION(get_msg_wait);
+static void get_msg_free_smi(struct ipmi_smi_msg *msg)
+{
+	if (atomic_dec_and_test(&get_msg_tofree))
+		complete(&get_msg_wait);
+}
+static void get_msg_free_recv(struct ipmi_recv_msg *msg)
+{
+	if (atomic_dec_and_test(&get_msg_tofree))
+		complete(&get_msg_wait);
+}
+static struct ipmi_smi_msg get_smi_msg = {
+	.done = get_msg_free_smi
+};
+static struct ipmi_recv_msg get_recv_msg = {
+	.done = get_msg_free_recv
+};
+
+static unsigned int ipmi_wdog_get_timeleft(struct watchdog_device *wdd)
+{
+	struct kernel_ipmi_msg msg;
+	struct ipmi_system_interface_addr addr;
+	unsigned char *data;
+	int rv;
+	unsigned int currtime = 0;
+
+	mutex_lock(&ipmi_wdog_get_mutex);
+
+	atomic_set(&get_msg_tofree, 2);
+
+	addr.addr_type = IPMI_SYSTEM_INTERFACE_ADDR_TYPE;
+	addr.channel = IPMI_BMC_CHANNEL;
+	addr.lun = 0;
+
+	msg.netfn = 0x06;
+	msg.cmd = IPMI_WDOG_GET_TIMER;
+	msg.data = NULL;
+	msg.data_len = 0;
+	rv = ipmi_request_supply_msgs(watchdog_user,
+				      (struct ipmi_addr *) &addr,
+				      0, &msg, NULL,
+				      &get_smi_msg, &get_recv_msg, 1);
+	if (rv) {
+		pr_warn("get timeout error: %d\n", rv);
+		goto out;
+	}
+
+	wait_for_completion(&get_msg_wait);
+
+	if (get_recv_msg.msg.data_len < 1) {
+		pr_warn("get timeout received zero length message\n");
+		goto out;
+	}
+
+	data = get_recv_msg.msg.data;
+	if (data[0] != 0) {
+		pr_warn("get timeout received error: 0x%x\n", data[0]);
+		goto out;
+	}
+
+	if (get_recv_msg.msg.data_len < 9) {
+		pr_warn("get timeout received message too small, expected 9, got %u\n",
+			get_recv_msg.msg.data_len);
+		goto out;
+	}
+
+	currtime = data[7] | data[8] << 8;
+	currtime /= 10;
+ out:
+	mutex_unlock(&ipmi_wdog_get_mutex);
+	return currtime;
+}
+
 static ssize_t ipmi_wdog_read(struct watchdog_device *wdd,
 			      struct file *file,
 			      char        __user *buf,
@@ -806,6 +885,7 @@ static const struct watchdog_ops ipmi_wdog_ops = {
 	.set_timeout	= ipmi_wdog_set_timeout,
 	.set_pretimeout	= ipmi_wdog_set_pretimeout,
 	.ping		= ipmi_wdog_ping,
+	.get_timeleft	= ipmi_wdog_get_timeleft,
 	.read		= ipmi_wdog_read,
 	.poll		= ipmi_wdog_poll,
 	.fasync		= ipmi_wdog_fasync,
-- 
2.17.1

