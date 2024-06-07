Return-Path: <linux-watchdog+bounces-1108-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E468FFDE5
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 10:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B96B51C23018
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 08:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439B515ADA4;
	Fri,  7 Jun 2024 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FRGdCAEJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A8213E043;
	Fri,  7 Jun 2024 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717748043; cv=none; b=MtOJCT7JZwDApkt9vnwlaW+f4W4Pef2Qt7/EDLYOivjDPLcbqY1VAcDeAxEjXFcy6dcsSdeqCDEKb8pNrSGWVOjdGeZI/mrKE3Sg0h9NDhuK0TKPPnffD28JqD/jCk4qDqi1t3SEoG2B/y85eZ4aMR/S20FlnTV5w3WGgYgLpRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717748043; c=relaxed/simple;
	bh=kra66mxB0q4iY/DDpaAHpvNHtIpyAm2YT0Vp97A28w4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=db7IZ/exXC5ccR9JUAf2md4RdUvQf49aGci0LeIxsfHjKPC18khKhDmCU5LIkRPiaoLZrJmoGTqByJQiEcAwqS2hlhR92huX7oMWavnCf4evqnHePIdQNhgxPS3pLokqoCPJNPS9oZbW8cJzBw4Vkh9EyKeSHjh6SndHDGly4oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FRGdCAEJ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2DFC20005;
	Fri,  7 Jun 2024 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717748039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXKmOZS+PQZzg5AMCG0XJBn+K8xjGx6LJU8WQ9B0p50=;
	b=FRGdCAEJSyXTggHVMudoJ28SRqrGunmHCbwlR06soLlU/wTAqeQnCh2Rgnfpe9pu3jt7qi
	4ezZQ+fYHwEAqIwDmqL46BxyOlSu2bsbnw7yLdQFK6uU/EuGU8nXxV2jvfzl3ikn9sCzsS
	4hAiDv8ckBC3NvSgxiq+s8ks73bDuES1NKNM2aZyH3Dy38OFlQ2vNIxPierDbmm9F3J48G
	Z9tVZT6PNGCxbYdgrkftJsO6gbamPWB1VbpMFew1e7mm07HWZRT65ViOuPdtgXGLMIEB9Y
	m/T5rvIsDCA9cJjRohhf5hrlAe8nZt+S7fG/If/5sSDHOnPiY/IV9lLPt7sY3A==
Date: Fri, 7 Jun 2024 10:13:56 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter
 Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 07/10] irqdomain: Allow giving name suffix for domain
Message-ID: <20240607101356.3ede2a17@bootlin.com>
In-Reply-To: <045828bd-4aeb-4d8d-b152-44a816a07221@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
	<bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
	<87plst28yk.ffs@tglx>
	<045828bd-4aeb-4d8d-b152-44a816a07221@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Matti,

On Fri, 7 Jun 2024 09:38:31 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

...

> Herve, do you have any idea when you plan to do further sketching on 
> this? Do you want me to try seeing if I can add the struct 
> irq_domain_info and maybe use that in the __irq_domain_add() to get the 
> name-suffix added? I might be able to send one version out during next 
> week - but then I plan to be offline for couple of weeks ... so it may 
> be I am not much of a help here.
> 

On my side, I plan to work on it next week too.
If you are off a couple of weeks after, I think I can start and move forward
on this topic.

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

