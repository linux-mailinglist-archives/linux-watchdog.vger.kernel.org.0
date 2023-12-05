Return-Path: <linux-watchdog+bounces-138-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A008056DA
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 15:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6885281C53
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 14:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771CF5FF13;
	Tue,  5 Dec 2023 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4wyQqAC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0C6A1
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Dec 2023 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701785419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zjpDU1pO5fL8Z2EU79m8w3lIjmII9ANV1M3MyIbt0ME=;
	b=d4wyQqACVsdorsE/8gvYbAJxF0KecSwj7F8BQLNN89kTas2CVteBPHmCb38JY+t4B5DE3m
	U/wTyQmW2YWUJktoqo/AXlo6mH8QcuVVg4miKYbDRxoNZCBYGaCTqvM/LYZ8jSQUQBV190
	eiltdiOLi5ah3gUEJbVm8K9dOsoWdBY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-hAEfsowROliopZ5AVRFZjQ-1; Tue,
 05 Dec 2023 09:09:30 -0500
X-MC-Unique: hAEfsowROliopZ5AVRFZjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A21B1C06915;
	Tue,  5 Dec 2023 14:09:30 +0000 (UTC)
Received: from prarit.bos.redhat.com (prarit2023-praritguest.khw1.lab.eng.bos.redhat.com [10.16.200.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED5A22026F95;
	Tue,  5 Dec 2023 14:09:29 +0000 (UTC)
From: Prarit Bhargava <prarit@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	David Arcari <darcari@redhat.com>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: Provide a better stop error message
Date: Tue,  5 Dec 2023 09:09:16 -0500
Message-ID: <20231205140926.397956-1-prarit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Provide a better stop error message for the case where the watchdog does
not stop.

CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>
CC: David Arcari <darcari@redhat.com>
CC: linux-watchdog@vger.kernel.org
Signed-off-by: Prarit Bhargava <prarit@redhat.com>
---
 drivers/watchdog/watchdog_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 15df74e11a59..f0084bf7c750 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -965,7 +965,8 @@ static int watchdog_release(struct inode *inode, struct file *file)
 
 	/* If the watchdog was not stopped, send a keepalive ping */
 	if (err < 0) {
-		pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
+		pr_crit("watchdog%d is still active. Stop by [%s:%d] failed.\n",
+			wdd->id, current->comm, current->pid);
 		watchdog_ping(wdd);
 	}
 
-- 
2.43.0


