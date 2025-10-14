Return-Path: <linux-watchdog+bounces-4385-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7AEBD9686
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 14:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7BF57354725
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 12:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53847314B6C;
	Tue, 14 Oct 2025 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nXjYcVAf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776B314A9B;
	Tue, 14 Oct 2025 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445605; cv=none; b=U+v6gQs7QZ7DGhA/C44aU0UkveIhHuPrf1zoJZyZ5xdoEYXP6oa4UOHyyj82L2TphZEUfDKgKt7rq2zMu3fXWFgD2fchPR+qwA8dtODoU+RnNfjjCgTcDh/jzxlsVqZupyfeEqH/HR/E1p3Yc32z3AJrtXe590cd7gaA88tMvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445605; c=relaxed/simple;
	bh=DRhmHRgT/le2KFserQHBusRx67PjyobFTm0/DGsI4b0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RXuor2jCLRRC3pb7H6AXv7diZKqp5qItbDfzUmpv66oQF3uCw8DBO4NMXIwg9T6Sn31eZtimDpXXvAuzZpMrMhu1T2qAC/nKJ2cpc+IUB0auXnnfrCNKzLsPpKpshSye0EiZ9Tty/tn4iZ1sj7OdIq9zUuKc9veOXkCfpdRvdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nXjYcVAf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2E0BC09F8C;
	Tue, 14 Oct 2025 12:39:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E23BB606EC;
	Tue, 14 Oct 2025 12:39:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3576102F2259;
	Tue, 14 Oct 2025 14:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760445594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O4tcipbPC2HHYlMaJKaUuOAv9lqowVzpEH7IATfw+yU=;
	b=nXjYcVAfgH3BO4xp2vWGR7034d2dX9xSrhM1MME8bOUErSzq5CWI1cL4fSQ4VHxE68pARz
	ngIK1el073vvINjm45En7XD08UQnETY7HgrX2uRObSUY8MOUlELo/2stYHk/mq4q3aXP/r
	j8Cvmu503+CPhATKURildyWFTljcz1VyoIMN1L0AaWWMEs2S6obJ89dLSTcj/TZ/wcsHOO
	gqK9LI/+WNslXfMpF+FSwvHnvZnnCLXx7t5j846G2Z7qf/Me8HUe1DXPu0lZGyzYvty0+r
	3yKYHBfK5QSkItH6+SD0Oat8ERm/xKXlQP3MwXp364+zbojSbO8di1tGX65lwg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: Convert marvell,orion-wdt to DT
 schema
In-Reply-To: <CAL_JsqJO-Fir5DLhZGsSWN2ZXNH+ynsqFXKKqAbePi30jf5EhA@mail.gmail.com>
References: <20251013213146.695195-1-robh@kernel.org>
 <87o6q9g6kc.fsf@BLaptop.bootlin.com>
 <CAL_JsqJO-Fir5DLhZGsSWN2ZXNH+ynsqFXKKqAbePi30jf5EhA@mail.gmail.com>
Date: Tue, 14 Oct 2025 14:39:50 +0200
Message-ID: <87ldldfyi1.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Rob Herring <robh@kernel.org> writes:

> On Tue, Oct 14, 2025 at 4:45=E2=80=AFAM Gregory CLEMENT
> <gregory.clement@bootlin.com> wrote:
>>
>> Hello Rob,
>>
>> Thank you for your work. I have one question:
>>
>> > +  reg:
>> > +    minItems: 2
>>
>> Should we also include this constraint here?
>>
>>     maxItems: 3
>
> No, that is implicit with the length of 'items'. (For json-schema,
> it's not though. The tools add it automatically.)

Thanks for the explanation!

then for this patch:

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Gregory

>
>>
>> This would further restrict the binding.
>>
>> Gregory
>>
>> > +    items:
>> > +      - description: Timer control register address.
>> > +      - description: RSTOUT enable register address.
>> > +      - description: Shared mask/unmask RSTOUT register address.
>> > +

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

