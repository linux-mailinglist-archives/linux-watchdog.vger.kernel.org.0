Return-Path: <linux-watchdog+bounces-1404-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B39351F0
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Jul 2024 20:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F0521F21ACD
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Jul 2024 18:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5462F58AD0;
	Thu, 18 Jul 2024 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="wHMmuVtG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C386345003;
	Thu, 18 Jul 2024 18:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721328630; cv=none; b=LNWFQr8NGZMXEWqt8pxDNnLVigAkzm/GhxpQ8tlPsX9A83G8YZJuXxLIyejgrJrx5wZXqLilGo2PN7mWG5WLAh+v5+p4GfD4Kb/Tjq+hlv7XUxS0AulfpLSA4FKkiFcqKjhluetpn/s65f3zs/qtI12cm5raGfCMakzgRubtcSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721328630; c=relaxed/simple;
	bh=tVz6fCpGpXcy7y6ufCkTu/lXKHadmeb+okHA7Q1mjJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3m44LNjaWzuFUJumsSynOKLoVfyuqhv9QELKGt1514chPpF61KcQpt/iCcIyOEtnnVcS6F1QVO5QHyqBqJjV883SD+0yNbrBABzJwLPV/ZpzGZkdAoH4p8wBlqtJyWzMnFgCpvf8q0R/uS/+f38BK3ypUFPvKNv1yWN5Vfv+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=wHMmuVtG; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id D7427409F1; Thu, 18 Jul 2024 20:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org D7427409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1721326936;
	bh=tVz6fCpGpXcy7y6ufCkTu/lXKHadmeb+okHA7Q1mjJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wHMmuVtGvjxjsI3TIKv9Mr5KZwWzIvOn8DzJsaPN/IF+7eoeq179D6ajg/9epHkms
	 b/HxgxruQpwvglupbgfGzjIcBIXGxpC9f+KpThCBVwKrXP+CU5sV1HIkTmhxTYwD1K
	 89RD9C5l5yq+0Z1tNrq4+1mTKKM4etBmF4ZFN5Lw=
Date: Thu, 18 Jul 2024 20:22:16 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mathieu Othacehe <othacehe@gnu.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Inform about watchdog timeout.
Message-ID: <20240718182216.GA17582@www.linux-watchdog.org>
References: <20240714154623.32676-1-othacehe@gnu.org>
 <8f9fde5a-9346-4767-89e1-efaf6288083b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f9fde5a-9346-4767-89e1-efaf6288083b@roeck-us.net>
User-Agent: Mutt/1.5.20 (2009-12-10)

 Hi Mathieu, Guenter,

> On 7/14/24 08:46, Mathieu Othacehe wrote:
> >When the kernel stops feeding the watchdog, inform the user that it is
> >about to timeout in X seconds.
> >
> >The message looks like: watchdog: watchdog0: timeout in 15 seconds
> >
> >This is helpful to warn the user that, most likely,
> >CONFIG_WATCHDOG_OPEN_TIMEOUT seconds have elapsed and the userspace hasn't
> >start feeding the watchdog.
> >
> >Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
> 
> I don't like noisiness in the kernel, and I don't see value in this message.
> 
> Maybe Wim thinks otherwise, but for me this is NACK.

No, I was thinking the same. So also NACK for me.

Kind regards,
Wim.


