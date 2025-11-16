Return-Path: <linux-watchdog+bounces-4598-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D457C61BE6
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 20:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D48A3359C9F
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 19:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D3A2417D1;
	Sun, 16 Nov 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="O6kathRV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696223EA89
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763322127; cv=none; b=u++ClTraz0M+f97dx9ekVuoBGz2OXwN71oKlbqnkExQcb1dvx//+jOVMJQwUHSaENLjmYgdaTXs8J7RdWynoJpcNrVXLO6q2WZjX+0ZZj/1j538Dm0klrLj1kbZ0SnPjxRE6X4+myFToWjkAdLnR7bE3H1CDFlWVK7Yh3KdkN8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763322127; c=relaxed/simple;
	bh=C2NA54vlt3FR1iSq7/x/Ntj+zsTxLJdG4nYGkFx37gY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=leMQi07MhSOZNp1UbzpxD8msnMh3WTQen/Xvg1RaJMgI+Ov9XQE9zN13Wtjun0ploQRadF+oHdtU7gVZYqUHYNrn0V8rnUvK44uPx3u8SkW7TWqUxhsg00aul0Z9HBv2/r5qpWn833+JrIMZUGRoev/JTz+UFCOnsY4D+Jgt3sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=O6kathRV; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BS/MXNFYNVSZjoySPBMslPiRUlXsO4iD/RXUoZeEs/M=; b=O6kathRVT1OXR7+t0WDqp/VcFm
	PQirwkwAjfKtOZxuwkkMjKL8Vp4kzYaQDJJa+iwllp6kfTHKSZtsE+/uEX6g2pReHKL1WIRe0hMSH
	kAbOum+Zt5xvclCIvPWCKezQ2uCQIGsuDVDc/gFex1OyWcRif5NQwZnExCCFa4nhXX+9n1m4Dn46t
	ilByh71NogjW5iKalWWpTFhj8UN26o0nFp0XMUhZ1odtwKDFNUND3vlFzQ1lrx7dJhgxw9C1PLRJ0
	OGS/lS0Pd1vNCtpceZwSsnJb2zz2I6H+AOUjmACHoKotRBmWnA3JPOlRcUxbNB/S2yoJD9DPS0Evr
	JlNuhbng==;
Date: Sun, 16 Nov 2025 20:42:10 +0100 (CET)
Message-Id: <20251116.204210.871371429161034821.rene@exactco.de>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] fix it87_wdt early reboot w/ FW started timer
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
References: <20251116.145908.308086523429052446.rene@exactcode.com>
	<72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

On Sun, 16 Nov 2025 08:22:39 -0800,
Guenter Roeck <linux@roeck-us.net> wrote:

> This is not a reason for a log message, much less for a warning.
> 
> > +		wdt_dev.max_hw_heartbeat_ms = timeout * 1000;
> 
> This should be set instead of setting max_timeout.

After debugging, reading the core source and RTFM apparently not. As
the time can be changed and thus .max_hw_heartbeat_ms should
apparently not be set at all unlike you initially suggested. AFAICS it
is the regular .timeout and .max_timeout we want to keep setting.

Best regards,
     René

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de

