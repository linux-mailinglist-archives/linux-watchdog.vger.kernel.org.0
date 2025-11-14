Return-Path: <linux-watchdog+bounces-4589-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064AC5E279
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 17:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5DA243A80CD
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 15:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB4E329E6E;
	Fri, 14 Nov 2025 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="juZ3ykM8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63888329C74
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134759; cv=none; b=EOgcP+WvnPMtWg1ZFEROCWzFblLVCLbsh03mTNRJDQctOjxLStaO0nzgPaTUQSySAKVYdE6aDnHLUaKnwL0IqAwQkycSTT1FAik7dAFGU/+gudHJou0RmJ/e+dP+Goy0bQAxCLZH8I7W2e4tfSxIoAj4PyJCM4ahFFd2X0CEBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134759; c=relaxed/simple;
	bh=ujFyK76oj8TRUZdfVqDmiqQY1H+BWhD6fGXoNA/vK44=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=esYEbcm/wGCPXaA5M7EQTHAD3+8651LMacULX8QN/FTn3i6ukxInTdVlgLesVBf8mNnFT6ARLbVa8/BhrgwMwQxnn1JkqOoyfYWOvvCBr0pO+1iN1pvzCwttj2m9R3kYxSPnm2QlerksERWxnNnNcyVhXuO12dyGUvMsg6RoFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=juZ3ykM8; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=GrXUr2uI8l48K2d3SFsrG1Aqea0+GczN8xvrOLBUGhM=; b=j
	uZ3ykM8Z7hSoKVlS2dGuafd9eATX6fpHYGB9K32DmlCHVxlpwGETktkL6/FXrcHo1RF0TFCUYNlTj
	edzTquKnVF5Q/tQkQBepzLwXkfo3i4jTqCGxfPFXfU3UcJP/58fA9wBtfcLAY7ZDOe4htGCLaFCqU
	VgLZSBsXNek5RHTdQnc9FctPrdB66AFXR/7VrBtclqxz7JCsX6Y8ccoDwFNin31F8ZV3rlAv56Dk4
	ykFTy2+Hel0+BtPFB+pCg0G+FDtmEXitokJmLpoRx66Q6/M6ibzrwSEKMCxAUvpOJjqSPn+AiWhRl
	lymqQ0PQzQtMBsBUivkQx/2K1IRt4RQWA==;
Date: Fri, 14 Nov 2025 16:39:11 +0100 (CET)
Message-Id: <20251114.163911.1677511234058361014.rene@exactco.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] init it87_wdt to prevert early reboot
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Some products, such as the Ugreen dxp4800 plus NAS, ship with the it87
wdt enabled by the firmware and a broken BIOS option that does not
allow to change the defautl time or turn it off. This makes installing
Linux difficult and annoying instantly rebooting early in an
installer; unless one loads and starts a watchdogd in the installer
environment.

Change it87_wdt to initialize the hw wdt register to 0 to make sure it
is disabled until it is actually requested to be used.

Signed-off-by: René Rebe <rene@exactco.de>

--- a/drivers/watchdog/it87_wdt.c	2025-11-06 16:36:17.474866809 +0100
+++ b/drivers/watchdog/it87_wdt.c	2025-11-06 16:43:56.756190409 +0100
@@ -374,6 +374,9 @@
 		}
 	}
 
+	/* disable, might be left active by the fw, e.g. Ugreen dxp4800+ */
+	_wdt_update_timeout(0);
+
 	superio_exit();
 
 	if (timeout < 1 || timeout > max_units * 60) {

 
-- 
  René Rebe, ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
  https://exactco.de | https://t2linux.com | https://rene.rebe.de

