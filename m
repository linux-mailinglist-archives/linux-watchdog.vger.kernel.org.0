Return-Path: <linux-watchdog+bounces-4451-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C9041C188E8
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 07:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51740352110
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 06:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C844309EF2;
	Wed, 29 Oct 2025 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyiZVdPK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423F63064A9;
	Wed, 29 Oct 2025 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761720972; cv=none; b=MLqmC7npXbGHAFoXl9p5ZDFwbp+RMpe373Oc0ESvotat40xijzv7Gpdf1zTkApS32UCuB91iyGb11jhgElgn5ZmLeZCeqJciSCgbaEbHHlLAhI4Y5ERQFFf+nXX3PEM0RqHAWVNjckQ55RyM9NGllAEi+X9kxwju3+P5HhfduHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761720972; c=relaxed/simple;
	bh=l+196rk3Qj1E1R2N6PcGKWNT7jd2HPdpzyOgOUHK7x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjOkCpFGriKaejn8/M8mdGwH6NNR2CTJwDqiNQWmg7qAPyWHxsD/AFrITwfn4Ed8r22wYBVMzzAkpupTXTDzGj7LmoQ7GfB66BrwYursXYZmPpCYAbdV6jAn/h5HvtV8xb5YFkb0s+nu0SkwhnXOhIGahqshagKwZk3DJTkUCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyiZVdPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B080C4CEF7;
	Wed, 29 Oct 2025 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761720971;
	bh=l+196rk3Qj1E1R2N6PcGKWNT7jd2HPdpzyOgOUHK7x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyiZVdPKmG4G0tl9CXwRUNMe5mGyhyDsNwhiSv+2fPuoj3N1pmmKBi4KApdAs2E6H
	 evoz9RBLkZjghVAQ6q9GXI8IRNxmX88YRJw00QIUSWsPhnaQ5bSwkkbk01hmPB31+0
	 N+8KaDBEzTxuIVFaTD5JcrdODy1EaommPZO3yXNJds7t99+NGsC6Tb+PkuaoSW9BgW
	 GtMwtl+5J3cZnEWDXyrnSDvcsV+jrBzx0KnGNN4UOFdHPmbsbst/lVV3wZRR/LxJI9
	 qSHUkyX+0ThzgBNordKOpshtvZD0kw6EYxMtq2f/KCQWDcV4dJeuonvw5lpKYPaPoR
	 8KZ1ngiqp7aQw==
Date: Wed, 29 Oct 2025 07:56:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: watchdog: loongson,ls1x-wdt: Add
 ls2k0300-wdt compatible
Message-ID: <20251029-whimsical-rottweiler-of-artistry-0bddeb@kuoka>
References: <20251029020913.1946321-1-zhoubinbin@loongson.cn>
 <20251029020913.1946321-2-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029020913.1946321-2-zhoubinbin@loongson.cn>

On Wed, Oct 29, 2025 at 10:09:12AM +0800, Binbin Zhou wrote:
> Add the Loongson-2K0300 SoC's watchdog binding with DT schema format
> using json-schema.

And it is or it is not compatible with other devices? What is the
difference? You just wrote what you did, but we see that from the diff.
Write useful commit msgs, not repeating diffs.

> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Your patchset did not reach lists. Only three out of six managed to.

Best regards,
Krzysztof


