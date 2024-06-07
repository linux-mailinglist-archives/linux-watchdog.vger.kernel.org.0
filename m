Return-Path: <linux-watchdog+bounces-1110-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BAD8FFF4B
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 11:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1EC1F27F0B
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 09:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B033015B567;
	Fri,  7 Jun 2024 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UyZ3qryQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734D13E043;
	Fri,  7 Jun 2024 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752218; cv=none; b=MZ6X3IiG9BM7wz9LDRR0ALZe/68YPsgz23VOhCnzIRGDZ2JZV7wavQ3T2luH5KyziSJvRdppk5lfQMpavb40J24yPU7i1ZyQtXht0cp9MdARUdmeJVz/HQZZoXn6UEL/BVjm3SroemYqKW616nBuy5q4cx4kLsZYuad1ODKQyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752218; c=relaxed/simple;
	bh=j85mgkeTusRS4Itc43hUJSsb/34CpqaC5r9jA8gYgZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWbM1QImsW716+bN2sjB+hhGSuG/5fDXz16uWLBjefDpTIu6Q0LHcBN9ShB5yZKtNdt8RUhiDWR/6SAbrEv5V157OCKmOZaWDWrsXlqlCsRhgCFbBXh6JmeAfyskPHCe5XGDzheT0VqpWkEQu1FrT7xHEeeVmWEPsEIe7KxuuGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UyZ3qryQ; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACD0C240007;
	Fri,  7 Jun 2024 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717752208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3W3sbBCarayP1thGCleMHMWpqnuZCVKbvI3U++3tYEI=;
	b=UyZ3qryQfLn/9lb2wCaaS4EvO/2/n0QeRtdYGr6SZjP3SFy/C9O4lHylDlZz/2VcqhSBLS
	eKJLjNDFFh+rTIHauAiBqx/L0Qh4Z+uBG6DCAPeP8CNG3BlKMvZJdyIAAUWFsIe3Woi/8X
	AXekPWROEVNTWsf3FezYGaLWmPyKR0IYZo6TUxm7O9Tmt/QnE8npZABBaQwuQvbCvgNuhp
	tJndOY8PNDVTuLJbrznPaBCQ23lXMkWcZrnysIYgdOwGw8EItzGRMrqtmIzqq2Ck072JCz
	j0y9GkxfrvR/qFnCgrCA7/BqWZ1kZy9bNbWV07ikJaazn+rt9aUBxF+liPJQyg==
Date: Fri, 7 Jun 2024 11:23:25 +0200
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
Message-ID: <20240607112325.27e23671@bootlin.com>
In-Reply-To: <b2b31803-44ff-462b-bc1a-6b1ffa93bdf0@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
	<bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
	<87plst28yk.ffs@tglx>
	<045828bd-4aeb-4d8d-b152-44a816a07221@gmail.com>
	<20240607101356.3ede2a17@bootlin.com>
	<b2b31803-44ff-462b-bc1a-6b1ffa93bdf0@gmail.com>
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

On Fri, 7 Jun 2024 11:49:07 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 6/7/24 11:13, Herve Codina wrote:
> > Hi Matti,
> > 
> > On Fri, 7 Jun 2024 09:38:31 +0300
> > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> > 
> > ...
> >   
> >> Herve, do you have any idea when you plan to do further sketching on
> >> this? Do you want me to try seeing if I can add the struct
> >> irq_domain_info and maybe use that in the __irq_domain_add() to get the
> >> name-suffix added? I might be able to send one version out during next
> >> week - but then I plan to be offline for couple of weeks ... so it may
> >> be I am not much of a help here.
> >>  
> > 
> > On my side, I plan to work on it next week too.
> > If you are off a couple of weeks after, I think I can start and move forward
> > on this topic.  
> 
> Thanks for the prompt reply and thanks for working with this :) I'll 
> leave it to you for now then, as I don't think it makes much sense to 
> intentionally do conflicting changes. I'll see what you've been up to 
> when I return to the keyboard :) I'd appreciated if you added me to CC 
> when sending the irqdomain refactoring patches (but I can dig them up if 
> you don't).

Sure, you will CC you.

Also, I am not sure that I will perfectly take into account your use-case
but it should not be a big deal to add it on top of my commits afterwards.

> 
> Have fun!
>

Cheers,
Hervé

