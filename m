Return-Path: <linux-watchdog+bounces-4395-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E726BBE1F87
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Oct 2025 09:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3428E4F9A73
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Oct 2025 07:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C850B2FAC18;
	Thu, 16 Oct 2025 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K+FGsNnA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B02FB0AF
	for <linux-watchdog@vger.kernel.org>; Thu, 16 Oct 2025 07:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600647; cv=none; b=HwyxfPFO7HKH5DqfE6qyinDGd4vQW2KvujrZgC87oJViXhKzP49A00VVlGSW2b9NI76TZPD/F2pwdJpSka/R9/DLmEwK2jB+MgdY/3kbT9fucdj5p56uwvYE2DDQQeJZLC+PbNm4opJxHUAL4JqZ2qCTwhl1cURnWULzKxnIvM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600647; c=relaxed/simple;
	bh=+mTzrvys3F9+OW14tdjLecvMRI+Co6RsgdUGWWkK3YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNdpGnkh/lYf6LjS9mqSCpYTBHhYiI4gcK0s9kipGqeqS/F08QbSCFFfibcjrHaXK3nLQikrQKDcBZusvR8IDoIbMu1kIt2Z4PZskPBQKaLXC35PD35cVML4TPCtQOWiNFfFLpbHAqIxOkdqkR94GiSote6AqG1SCmly633UyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K+FGsNnA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XBUK
	N1SEhsBqmECAmB4rfN83djDL7LtTXfpKwi2mIlo=; b=K+FGsNnAK/6W4+nLlDkg
	HNgGrhbjcv/9PBpemQBlJRYaLvcilxzBkYMs0UmLS01d/8wQENoxaSbQVkJtyBmt
	KHDVF88WRepwmJawiJgkaSy0XLTol6WlMS/4G/FLNhQIevWYb5nn+YhrDYgs8xGE
	ZUZdzVSbYhKxwGz5CF0Ld3dOcHkxIwvm4/4/lOxcPIR+aqxMxHza3+s6WH0Wxpv5
	/601nuagFvR1KMvzpPeOAuxeHrC4JfLhXGU7rX7aClGyEI/sRRTTQHcNVJ+gl2XW
	vIlEX8lZaqfy5lDHEBCowe9BxovA5EtUFebUiJI263Sn8OoRWxDzvkH43/A5UcOT
	WA==
Received: (qmail 3712329 invoked from network); 16 Oct 2025 09:44:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2025 09:44:03 +0200
X-UD-Smtp-Session: l3s3148p1@S/vux0FBJMIgAwDPXwQHAL/S9V79e5yL
Date: Thu, 16 Oct 2025 09:44:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: renesas_wwdt: add driver
Message-ID: <aPCiQ6P9tZBmuscB@shikoro>
References: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
 <20251014112953.25712-6-wsa+renesas@sang-engineering.com>
 <9c1a61f6-f9aa-40b8-9578-adf0e443d790@roeck-us.net>
 <aO6-S6uC1aEsAsNL@shikoro>
 <7cf0b3b1-c1e1-4df0-abbf-c4e4b542a836@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cf0b3b1-c1e1-4df0-abbf-c4e4b542a836@roeck-us.net>


> > It depends on how the ECM is configured. It can make sense. If someone
> > misconfigures, it might not make sense. But maybe we just don't use
> > pretimeout here because for Linux this is system-wide while the WWDT
> > usually has a smaller scale?
> > 
> > Does this make it more clear?
> > 
> 
> Yes. Assuming you know what you are doing,

Hehe, famous last words... :D

> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thank you!


