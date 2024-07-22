Return-Path: <linux-watchdog+bounces-1413-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42733938FB1
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 15:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED2B51F21F6F
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 13:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1A716D4EF;
	Mon, 22 Jul 2024 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc+YgmRX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE2616CD07;
	Mon, 22 Jul 2024 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721653947; cv=none; b=qw8m9H1f7YDykR9EgBkmCVHcneMvB4QNtTgPM9kwUVq6v+1S8YfvXdx6RBIE4NnMoWOtOlZxZjvF9lE4U2+AcywYzbmEmkzzjVfyJpaZ4Ym7rDYgXXMqClC38Zo6Omp8BcRmzYmbFqIEuk4/VBVR0NvgSKIqmXMFxyYiE+sEddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721653947; c=relaxed/simple;
	bh=bMT2dyBII7tLgqT7mnBHGSRjOTh9mxWb08VtzOIC8PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6Kc6hZur1C/u1520NHn9WZNfzPCp5R2yZZVUMW76yTsfGFbhW5oCoo3AQvuAD2ewl+0yiBW1irvzJyIoiz0acW72flGtQzxyrntlw9DTKTrGPcwyyZXR21xHdXrKa/DKi6znuweshbKnscPgd9eR3DpPv/iDVDqhk4KCL6yXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc+YgmRX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fd66cddd4dso24691105ad.2;
        Mon, 22 Jul 2024 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721653946; x=1722258746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VZJLDD0LzaMvG1+dbrIfZxfQlgfBT2L9YVJz4EoL2CY=;
        b=Xc+YgmRXqOVY98pOS8Y4CzGHYlFruQOdOchLOgOylmGLw56rfGSUuqfwh4fJDcikki
         pRKyI+D+kFngNXDf6lJzpRgINWTjOgJyhShGILdLRBjzaW7p35WRYckxqZqNdzRNq+sH
         XJaseOodlONU4V+aipxKFu13bLwb4ehhdEIeVLteyrnKogU2WM96xwvlqtIw5dC/Uyug
         6i99g7F0sMiml/wuMSrHf/Dl0TsoFzNWNToqOixC9WSJ8c+ItsteUk1OAo1dMbQS10O+
         Gm84Trv5uHKwvKL4ttkEO5PfEw0/rdnnB/Ln5UBOeVyC231em3gokntbfdRqw8+oe/jW
         7tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721653946; x=1722258746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZJLDD0LzaMvG1+dbrIfZxfQlgfBT2L9YVJz4EoL2CY=;
        b=JtwdRAz2X/ZqVjgfnH46fB+LZiKfwFHQv55vXXkptZQ7JdMey/NU2FzMn1tJ6fq80w
         wlpxSmbornsLoiXlCYAl+sVUzIKTGIF4F0G7ERmXoTZx4tb9fgXG5BbPA4AHawy6fXtL
         J0bmWp6AODFXOMT0fcnIvlv7X6o3EhfoV8bk95eu+cJlPK6I9/gr7hNLm0PIpXC0RweI
         U8YfwQc9qXJxaGb/a3d7XhFu6ExQM6XqFiZHZ4GcoxR4mz2yT/+VTimrTSXTmZNN9PuB
         dLj2WMce6egSRP7N6WDaGVDBllg9CUp5BJGLB3HlJR0mUmH4lXwc3TzQXeJj9ouZa8NC
         j9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2a5oMuDZmz5Mn/053JiqdIZu4jD448OEJgv1Puxc8Zwdor5mRBLaZ0wcTVjEDi0Ut3+mjfKE8cDbUicXwU178LXFJZ0z9zuLWKqxFWYV+K4sy4uFNshpMoJ60lMV8TZXN1F6hKcP0FEzXWBZlK9PxXNyuS3zQiSvtnazGVCnlfMpwlvWrIJy8
X-Gm-Message-State: AOJu0Yz2O6ewrRiAgJlHSxjsfOYe4lj20Yw67f4Ezof+yljJdQwIpIDr
	6fnZXNlecYPSGF/Gz3v3EZBS6fPkS1u2+YAt/EZ167+r0lPFRxPhYd4eU8Rr
X-Google-Smtp-Source: AGHT+IHG1BXRYZ+x1YPG7CjIyEVdTJSWOj86Zv1/fM+njufIQEUsw2K+wJ72egtjd+HP1XdZ8UkDiQ==
X-Received: by 2002:a17:90b:2305:b0:2c7:ab33:e01 with SMTP id 98e67ed59e1d1-2cd161b88c1mr6775862a91.27.1721653945762;
        Mon, 22 Jul 2024 06:12:25 -0700 (PDT)
Received: from five231003 ([2405:201:c006:312d:8653:831a:b06f:a502])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf80a8865sm6937621a91.49.2024.07.22.06.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 06:12:25 -0700 (PDT)
Date: Mon, 22 Jul 2024 18:42:18 +0530
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
Message-ID: <Zp5asqhipQHEoviM@five231003>
References: <20240721170840.15569-1-five231003@gmail.com>
 <20240721170840.15569-3-five231003@gmail.com>
 <629a925c-24ef-4a44-832f-a06a60c266a7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <629a925c-24ef-4a44-832f-a06a60c266a7@kernel.org>

On Mon, Jul 22, 2024 at 10:15:03AM +0200, Krzysztof Kozlowski wrote:
> On 21/07/2024 18:28, Kousik Sanagavarapu wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,davinci-wdt
> > +      - ti,keystone-wdt
> 
> This does not match the original binding and commit msg did not explain
> why such change is necessary.

I don't understand.  Do you mean both the compatibles are always
compulsory?  Meaning

	compatible:
	  items:
	    - const: ti,davinci-wdt
	    - const: ti,keystone-wdt

It is enum because I intended it to align with the subsequent patch
which changes DTS.

> This also does not match DTS.

Yes.  I've asked about changing the DTS in the subsequent patch.

Thanks for the review

