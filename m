Return-Path: <linux-watchdog+bounces-1416-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A1939046
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 16:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E491C208AF
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 14:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AA3161311;
	Mon, 22 Jul 2024 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKhelIAJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA858F5E;
	Mon, 22 Jul 2024 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721656987; cv=none; b=TObr26riQUF4nnAQ55XOZwPj/mW+kiqf6F4SylHu1yRzdqeN3W4sPBHlrA/6A2sUO1Tk8WveQe94Pm7gjgnezzK7J2KjEDurZILxu9NfsypTb8lmxVR0NUz2n6OPuMUyrvfg1p2C0RMIzvIs9dXXJrYmZvME+9RnBalz+NejG3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721656987; c=relaxed/simple;
	bh=ynwZ4t58tKSgmVQqyFTQtFETjRIxYDGf7mo1oxOOCAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s66N7bBKDJUKEo140Hp3EDHJyaWE48Sjn3PWx0SCNIYXLRdhb6JrgvXdQFGhw/MeUUsYVTzvIoMfcynMlNnMIzPOqOkHRO6Ai0KiK1HjJu4PgaUJM9UtdlZPJHb+uGy+6f7f4uZbZkmbaevpcUXa0JhPau8DQQTKfgDG67arrJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKhelIAJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fd66cddd4dso25214895ad.2;
        Mon, 22 Jul 2024 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721656985; x=1722261785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mtHNdbyEsPDzz18RGuCJiRbWlFGvSqg44axaeswU7vE=;
        b=EKhelIAJaxwSYkqNXwfDAWanfkunjSvZZrrfBiHxPb2il5m/+PO3d/3qSnrUTR9nKN
         wmwrAuX8rF6jWNtvNPIkwe60aTzmC1fV8bfCNYupO6QSsUxYKRxi5EOlpA131gfzEjh3
         R4LeyG7VW3YsKSZKTGf7l/freRl/6nU2F6K0NEPexjLVy/BhiHXiqEdFilMg80v6xETe
         f0uVlgA+JYqmR07AkioKxViLL3rgFWjXzhLpbTS21Sre87qBhtpetjwoKzJ6dkdUw/3h
         x/erFXnUVNuco6bx6sM1LftJsbw9jI1M3c4W+2IPHOQhK9q47cF98JoUdrptCDIbzDfm
         MVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721656985; x=1722261785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtHNdbyEsPDzz18RGuCJiRbWlFGvSqg44axaeswU7vE=;
        b=YxX+o7uAJIvxFp5QBuG7DCNW1chOW/jaozc7K1z+egnqcI8QXZasNdCh2tcfYMWCmM
         BkA/6m5PguANrsQS9UncyQzPUtqhNDgVxb6gjnTHHGGvJDH7ASr0OV5Zw2zTsjZ0dzls
         g60kwef0scNE+Ob5xLLixSpRBMBQ7fFgrUia7MnXqsx8hwnA56yFXoHaUkbeYzrPEOs4
         JTMkohgZlzIyRgDa8ONcN/OkshWuJ4YsDdqSbbeVkCq7G0S6asTcV4cXF5YMns//f2cg
         8KJTKoHiX9KC25lD7CrTj4UJJmdUhbLzQuJP5wp6piWtxr93T+MtGkJanm0mMRhjQPdQ
         uTmg==
X-Forwarded-Encrypted: i=1; AJvYcCVW4PuTg9TnGrQg5iAPhkRift0aGDEfcjpQoc06x3ulmkdVeFmQFmj6N2KNwzGvYtbvXpasNwHYvSxxB2ini2EnHhjbvE3NX9CnS2g82Mf9n8Gnp9T5K5hVw9Zy9HWCFq+sDF5fo/sej7c+7swgNM/l+ikKdgscdqlsIORyKuWT7VefQryGJ4e1
X-Gm-Message-State: AOJu0YzRN3MQ00aE+uR0fILBnkxHqGqYc/FWAxBRGOz2P6aqbdkFMwXH
	BanKQbCuUfis5MO/bRtd+3fs6r7DWhDbhJHatKRhjpf+FZ7c/Dqc
X-Google-Smtp-Source: AGHT+IGFt3jkG6S7Vi8FeT6dkF7VryXqlry4aVmBf5zMYAhOQLHSE0E5fAr5qap1gGLWd1gskjd4EQ==
X-Received: by 2002:a17:90b:789:b0:2c9:69d2:67a8 with SMTP id 98e67ed59e1d1-2cd16037674mr6660232a91.9.1721656985062;
        Mon, 22 Jul 2024 07:03:05 -0700 (PDT)
Received: from five231003 ([2405:201:c006:312d:8653:831a:b06f:a502])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb772c23a8sm8322709a91.1.2024.07.22.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 07:03:04 -0700 (PDT)
Date: Mon, 22 Jul 2024 19:32:57 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] dt-bindings: watchdog: ti,davinci-wdt: convert
 to dtschema
Message-ID: <Zp5mkcDca6jRvOnf@five231003>
References: <20240721170840.15569-1-five231003@gmail.com>
 <20240721170840.15569-3-five231003@gmail.com>
 <629a925c-24ef-4a44-832f-a06a60c266a7@kernel.org>
 <Zp5asqhipQHEoviM@five231003>
 <2d8ceef8-9d5e-42a9-af2e-f9292728a3bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d8ceef8-9d5e-42a9-af2e-f9292728a3bf@kernel.org>

On Mon, Jul 22, 2024 at 03:50:15PM +0200, Krzysztof Kozlowski wrote:
> On 22/07/2024 15:12, Kousik Sanagavarapu wrote:
> > On Mon, Jul 22, 2024 at 10:15:03AM +0200, Krzysztof Kozlowski wrote:
> >> On 21/07/2024 18:28, Kousik Sanagavarapu wrote:
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - ti,davinci-wdt
> >>> +      - ti,keystone-wdt
> >>
> >> This does not match the original binding and commit msg did not explain
> >> why such change is necessary.
> > 
> > I don't understand.  Do you mean both the compatibles are always
> > compulsory?  Meaning
> > 
> > 	compatible:
> > 	  items:
> > 	    - const: ti,davinci-wdt
> > 	    - const: ti,keystone-wdt
> 
> Yes, this is what old binding said.

That was what I thought initially too, but the example in the old
binding says otherwise and also the DTS from ti/davinci/da850.dtsi
says

	wdt: watchdog@21000 {
		compatible = "ti,davinci-wdt";
		reg = <0x21000 0x1000>;
		clocks = <&pll0_auxclk>;
		status = "disabled";
	};

Or am I seeing it the wrong way?

> > 
> > It is enum because I intended it to align with the subsequent patch
> > which changes DTS.
> > 
> >> This also does not match DTS.
> > 
> > Yes.  I've asked about changing the DTS in the subsequent patch.
> > 
> 
> Changing the DTS cannot be the reason to affect users and DTS... It's
> tautology. You change DTS because you intent to change DTS?

Not exactly.  I thought that the DTS was wrong when it said

	compatible = "ti,keystone-wdt", "ti,davinci-wdt";

while it should have been

	compatible = "ti,keystone-wdt";

I was not sure about this though and hence marked both the patches as
RFC, in case I was interpretting them the wrong way.

Thanks

