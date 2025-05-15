Return-Path: <linux-watchdog+bounces-3480-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D426BAB7F99
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 10:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7D04C550E
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 08:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C536E27BF76;
	Thu, 15 May 2025 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pJ8cUNUk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DF2798F4
	for <linux-watchdog@vger.kernel.org>; Thu, 15 May 2025 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296192; cv=none; b=qJRwND32y+I3zyhgHAU6ab10gvU4XvsMb3AOp3Amus2daVdlTLoc3eTRV0/EXEXvThWLOciD3lMr7862Rb04UuZkecAReaTjRaFCRLRZu5iJgGBR9k0rR9T/10UVfsMx8X087bCEsOrgQTNlgYTS7vy2MBGmEkkMBViNJibgDyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296192; c=relaxed/simple;
	bh=of5W8eKVyNDMR3PDIDx3jc0OsUPgpBWDqyoq5bv6hd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ITNfcdr09xYYWkjm/zA3xXqvYSIbRUwYlfHaDB6yNArL8JZefwNjMFm6FvO94zgZ+GHP1OBxFPl0jKBMrCb8vdDgoboji02Tdacnuqe26pDX626OI6J41sJ/24cT+cP0PK0mssXyYQr5S9bbqv9xYnGRZxsRwAgAkH5qQe3MN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pJ8cUNUk; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250515080307epoutp0170073cd23f81bbcf5cb603282c4bde88~-pJ-xA1sY0912409124epoutp01c
	for <linux-watchdog@vger.kernel.org>; Thu, 15 May 2025 08:03:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250515080307epoutp0170073cd23f81bbcf5cb603282c4bde88~-pJ-xA1sY0912409124epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296187;
	bh=Tkp0DQwXc1mOn4qy+xZBw8LmMOr1qvZhRe+FhWG/Q84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJ8cUNUkyQw+ylK+3ntdvOjXnn/bCBbSFaeNHcLeFapeV0B81MujwqvS/n/lR65jz
	 FFl5/UQJZ4n40i/huhuGRT148O4g0hXBqUL//i7fz39GF/TYCuxlfC3Xk6c7sOfTZ0
	 c12ha3a7RjNNmGwxy/otGLNhNe5Vt5lfIopUGJOU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250515080306epcas2p481b6f11776427b56173731bd63fa4591~-pJ-a9u7B2562425624epcas2p4b;
	Thu, 15 May 2025 08:03:06 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyjPk2H2sz6B9mP; Thu, 15 May
	2025 08:03:06 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386~-pJ_OI3yE2143021430epcas2p40;
	Thu, 15 May 2025 08:03:05 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515080305epsmtrp2f76e6349f9cba96800c1fd2046b971a8~-pJ_NWHhQ0238402384epsmtrp2k;
	Thu, 15 May 2025 08:03:05 +0000 (GMT)
X-AuditID: b6c32a28-edfbf24000001e8a-61-68259fb92c1e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	06.C6.07818.9BF95286; Thu, 15 May 2025 17:03:05 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080305epsmtip2160d2a09d0e53fdf3e15513c5ad463f6~-pJ9_fQdi1287712877epsmtip2V;
	Thu, 15 May 2025 08:03:05 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 1/5] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Thu, 15 May 2025 16:53:46 +0900
Message-Id: <20250515075350.3368635-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvO7O+aoZBmc/KVo8mLeNzeL8+Q3s
	FpseX2O1uLxrDpvFjPP7mCxurNvHbvFk4RkmixmLT7JZPH75j9mB02PTqk42j5Vr1rB6bF5S
	77HzewO7R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGXMejKTreAAe8XqlaeZGhgXsXUxcnJI
	CJhIXLxwnx3EFhLYzSjxfrt0FyMHUFxK4t0zS4gSYYn7LUdYuxi5gEo+MEpcWf2eESTBJqAj
	Mf3fbRYQW0QgTuJY+2ZmkCJmgZ2MEi3TfzODJISBEuvf7AYrYhFQlWh49h9sGa+ArcTum2vZ
	ITbIS8y89B3M5hSwk5h4cRcjxEG2Eof3PGGDqBeUODnzCdgcZqD65q2zmScwCsxCkpqFJLWA
	kWkVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZwwGtp7GB8961J/xAjEwfjIUYJDmYl
	Ed7rWcoZQrwpiZVVqUX58UWlOanFhxilOViUxHlXGkakCwmkJ5akZqemFqQWwWSZODilGpis
	iqe/zHr6tnOLrIuAHK/Gtc6/fHqyHUd1X6dddj5sFSH3pU/7j7flt/V2fvb/TGoCQzqvXOGT
	ex2+hv3xnd1tuewcRjN+9P7Ojuyx+Zez2uz0Ql6dlKvhohkvf88RWqTW2rtvn4HDfYWY5VES
	cclfJz7NmJO84PQ2z52Gq9a5bLC6YqxXtEPh5C+FdZOP3YpP33H+r/7bBZPsdq6///t1nZz3
	n8CXEsknwy/b7Lz/i+XQJL77gnOmHuC/euvaXf4doccua0r4MN5ue+pYkTvX8HbGzxvz0jdP
	rY173qK6giHCVUrmYEOhwcLID6cvfnKrebCTkyNcfWLizRO6GQ5zn/aa1rrPqZ1UL3Ox6Plv
	JZbijERDLeai4kQAYiq1XOcCAAA=
X-CMS-MailID: 20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386@epcas2p4.samsung.com>

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index bdd81d8074b2..228f86d83663 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -555,7 +555,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	if (count >= 0x10000) {
 		divisor = DIV_ROUND_UP(count, 0xffff);
 
-		if (divisor > 0x100) {
+		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
-- 
2.40.1


