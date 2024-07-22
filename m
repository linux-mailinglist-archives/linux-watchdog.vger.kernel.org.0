Return-Path: <linux-watchdog+bounces-1412-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4E938F81
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 14:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 173F4280FEB
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 12:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247E816D4D1;
	Mon, 22 Jul 2024 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFqMgMeC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5238161311;
	Mon, 22 Jul 2024 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721653156; cv=none; b=nihpLM45+NP+CruhXLcib8kDeo/1B5gugRC5W/nWdJfXChc+VrEOzddKTm3pWmcdbcGMeRN6rrhYgvNTPqjnZ0jASp71n73P1E9fjM9ZHK/LMacNO4mEIPB/ea4GuPtwPcxvCBrnup3tSYuenBxHqHWrvavSsemqREX7LUwrPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721653156; c=relaxed/simple;
	bh=H1jChDRTMBd/K+fMxdIG948C8/pw9MRAl3zwTo053rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRw8jzMhoG9HElkuEaOnorj/kR0PAMzY6DgOFQfxqEh1g7i/NB90cJU2AUFQTA7GH3rdeK+fo4d15GNPCVP41+lwxwvSxJrVKehwVvhWs16yn4oFgfZCAEiZRB6CKDbwXthZqLXzjvXRoWcq4i4yDRl9pdZeXpBNeVdGuqYKxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFqMgMeC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fd69e44596so17662315ad.1;
        Mon, 22 Jul 2024 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721653154; x=1722257954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2REd3X5WZQ51xA/WHKGj1f7olfYQL735gvSN8OuSqg0=;
        b=XFqMgMeCx2ihtzs7LN4NaY19HaHsq0HeCUcx6/MQE9R1YiHlshMaw3MioKHqsWT4nt
         gb5JYKJC6vG7WQMjrNmfGTgOkTJeyMiLjxdz/E/O5aWvJKTXP6WsEAXOkj9qZDhfZY+B
         l9Mm5rqRHxENAQZbe6+yFOtmkIOTMSJ1HQfMocjHl88xiemGRU1LqfPCtCfIGXeWlfOc
         az1XkcV9O2PGwl+dPIqW5+i4zSMQ3QfK2rJZjkbz5Px1jVLzsOqKZZBsiEvNdg85kyTP
         9/fU4BfAyxcZcJWk8858QoG0TOezH7Rf3clFmRFoZXBrRQ/K5jDRfv3LNCfwfPR9ZHaq
         tBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721653154; x=1722257954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2REd3X5WZQ51xA/WHKGj1f7olfYQL735gvSN8OuSqg0=;
        b=azQV7hHbdkoiRC3C6kY0TXNAiPsSsKbm0WOFo2UuNID3lYXCB1Ajxza//30Zlfjdln
         tv7be5UHUAdc2uXSQvlXEZ2ZO6U4OR5cyjTBjopwL60h3vTto6+87W3zyGwd9wheQOba
         1XQTu0hhHtDaHoMunC3tCSX9QgnIED+PUBPwKVR3EU6+TUnbjoCHN6x8BlQxsdDOGbXC
         Y9ext3AJwi2lABFcSf2ZDiVgleyCUfFG+eFYWHO/oiSYFlizDe8pnHcYP2w95sJyAviE
         gjaH6zI0i6QY7PhWOaF6d6jfMJTvo8rsgnOYbkc/cYorDx1ZxVoQhj0mokeiNjAygCil
         w0kA==
X-Forwarded-Encrypted: i=1; AJvYcCVRvMN8C1JC9hfBY1yGEYl76C9g00pTXAxQIvoN3Vn61cBCuV2cPVncZyGt1MZfh+8QJ9IgfvJjSLzQxRbamCGuOEGc54FIOufLnoyP4STLb9GwKH9+0cJepVig+nDVx/NY1R9nUyBSl64an+zFEPKgIFzXBxoX3qxgy5aX5j+H5E0tEEhRddlA
X-Gm-Message-State: AOJu0YxP+ANAq1kgnfTy3UkNNomaz3OOXxCK86z2CMgQ29VlCqOh8xRK
	QXCpcqv1Xo7OukX6mGHm1klL5jN1oBouvA4nhFkdu46Xfho6w8fO
X-Google-Smtp-Source: AGHT+IGECuvQesrKXvq+m8mprsJcpAAmVERdZ7RxeVB7BHNh14/YI9y9pw2/AFOzLelNTOmTptqVhg==
X-Received: by 2002:a17:902:ce0a:b0:1fd:96c7:24f5 with SMTP id d9443c01a7336-1fd96c72c74mr66674435ad.5.1721653153810;
        Mon, 22 Jul 2024 05:59:13 -0700 (PDT)
Received: from five231003 ([2405:201:c006:312d:8653:831a:b06f:a502])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd7e6d98d6sm43050075ad.249.2024.07.22.05.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 05:59:13 -0700 (PDT)
Date: Mon, 22 Jul 2024 18:29:06 +0530
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
Subject: Re: [PATCH 1/3] dt-bindings: timer: ti,davinci-timer: convert to
 dtschema
Message-ID: <Zp5XmteG2rmklhZK@five231003>
References: <20240721170840.15569-1-five231003@gmail.com>
 <20240721170840.15569-2-five231003@gmail.com>
 <90413248-8849-4533-93c9-3a976aad0295@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90413248-8849-4533-93c9-3a976aad0295@kernel.org>

On Mon, Jul 22, 2024 at 10:11:45AM +0200, Krzysztof Kozlowski wrote:
> On 21/07/2024 18:28, Kousik Sanagavarapu wrote:
> > +++ b/Documentation/devicetree/bindings/timer/ti,davinci-timer.yaml
> 
> Use compatible as filename.
> 
> > +description: |
> > +
> 
> Drop blank line
> 
> > +  interrupts:
> > +    minItems: 2
> 
> Missing maxItems

Thanks for pointing out.  Will fix in v2.

