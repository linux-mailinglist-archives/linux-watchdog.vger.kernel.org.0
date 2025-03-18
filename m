Return-Path: <linux-watchdog+bounces-3121-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F301A663E6
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Mar 2025 01:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160FF19A0BC9
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Mar 2025 00:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E67DDCD;
	Tue, 18 Mar 2025 00:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="hiwJHTyI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C2329B0;
	Tue, 18 Mar 2025 00:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742257838; cv=none; b=qRdG4L6p3hQqS5H8V0p1ZJCfIdEHK7Th31d95cB4JfR20vjH63n4rm7Zjtgbko3tgca7wAp/yYXf0e1cMWEcof6gX0Ah5qDFcZ5H+aMoZ4zYF8gcUj3ar1XRdUZzTurWaZRgK/cgVh8V5byuQ5CJQ0unizJcHqY2gXCiiOp6Anw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742257838; c=relaxed/simple;
	bh=qrJOuxJutwKayDAiU7200Ih6LBL1oWuqiTNfvlEeLSg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dRED1EU0WJd/NM2IKe7DWS3ofXuqc4flcW1B4Sii/JRIrVkA0JkLw5RqlGrR9bOkE9hXzfdC60+Ul6yBENIy9j0BoPaxvBMjDgGWLxLR+OIOKFr5S71pNLqVtJAT0+c6WZ4wMZoYzYHV+U8eccKv2Jjo9wtLkFOHb35vP4xlxJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=hiwJHTyI; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742257827;
	bh=qrJOuxJutwKayDAiU7200Ih6LBL1oWuqiTNfvlEeLSg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hiwJHTyIEKAeof16Bs2vj34PRfatLyOQG/jqDqNY5IoqgH4o7JRAgU4RVKn9R9lkq
	 uzsMqS0GQjqPAHjj81SjHn6QGVre4DQY9WH0mWU8cK2uvurZwecbYObQNbhWTHxRVq
	 Z5HtIZ/pV5uD5ImuWEayi+CnXqofCABoRR9/iBqbuvfcobTRiw6xYmZCMer7GQhP05
	 7Cu6wSrfZ4Kz83e5bnljLZRcOwL1oN0ePXUaiVPLBfExbYgEuj8Db864ZnSUVeGK3j
	 q5U01uGiB0r8wYGjpz10hlsbkXRN9LqHlJJ6TREpRy6BUwbM1uAH1ot2DVvKDvZBBy
	 30nZnWwU5mZzg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0F7D977BB4;
	Tue, 18 Mar 2025 08:30:21 +0800 (AWST)
Message-ID: <3c16b98f113fa8918c879a16580811556b0c35c1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>, Joel Stanley
 <joel@jms.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 18 Mar 2025 11:00:21 +1030
In-Reply-To: <20250314160248.502324-1-arnd@kernel.org>
References: <20250314160248.502324-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-03-14 at 17:02 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> On 32-bit architectures, the new calculation causes a build failure:
>=20
> ld.lld-21: error: undefined symbol: __aeabi_uldivmod
>=20
> Since neither value is ever larger than a register, cast both
> sides into a uintptr_t.
>=20
> Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks,

Andrew


