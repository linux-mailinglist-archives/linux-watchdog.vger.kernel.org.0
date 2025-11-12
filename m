Return-Path: <linux-watchdog+bounces-4571-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD5C54DC1
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 00:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA14434306B
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 23:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D1C2C15BE;
	Wed, 12 Nov 2025 23:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE+G7Uko"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFFB2E03E4
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 23:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991663; cv=none; b=n25Ngwv69Z+6U0e85guDXET4nc/9iS4lhvCfEcHaCS4xTZPgKz/ElSjen3fZnEgsmeaU+YEqs25LzmYko2b3aZqcSYVziVF9+K2WVf5g3JaoUhyLVayuAgk2ZgPARgWTJijYJ4eg7cmUa3UaDuvFn5YpndZ02CTD9yHOpSB2DrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991663; c=relaxed/simple;
	bh=TNhOm2+mPi4NYVbMtUGere0nf/f+uNkQNxC2/uwPVYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBhJMeiOfHgYRMr5pYaxZfiXVV/mAd3JkfwQtMkVrKk/iiAdBZW4hZX3dTYRZMG8BqPqi3Btrn+7rtHalTk7pb0hEcb5dl3NlDGcBPBA20BpK5jGgKBji3XdWzk7lSGKJElcsD28G6wVKj5UTizVrj5XdLNDLx9mJTV0fRIlbWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE+G7Uko; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aad4823079so184799b3a.0
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 15:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991662; x=1763596462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpaElP4SSyxGWg0zUUZ3WOwjT1Hm+DZrZlFdZZBBlhY=;
        b=gE+G7UkoRQtabQ0asKFVnbIToeZWA4fHOG85Zlqtn9n+Z3W8N5J5piJKOHSkSDSZk6
         w/FCC6C5U0gTeoRlLb9McGR7hm3kV0rOMMAfuPKZYwcUmZ9LpH1Nvnvq6AVJXtnP7H9J
         RvezCnvyR1MIBMSOGcoQEIMurIYD5UQ6P8tHXWJLDLK7CaY3MS6fUhRtNI93qip8PkVp
         rtH2j+Y8v0UZ/kejoNOEa6AATJHerN9OS9HbblZcvUMqjDFWS8NkZbiVe05CiOMYdjes
         2nVi5yLjyoAL7YISZMftp/tmqowOm2rJ7jvFaDf7DYMHMA3lf2yItgdSYwmwmTm1GLWc
         nx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991662; x=1763596462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpaElP4SSyxGWg0zUUZ3WOwjT1Hm+DZrZlFdZZBBlhY=;
        b=J8gNZ1gluehxPjHduUgbq4Wj2KkvKouzZg4cVCFNbT7B3sG8Y32q7CeheEIHCJPgkM
         8NvXP+ZC7lv/D1JtzDiWL4fmkggUfhgziaJcquEBuF0afQ4mlltndslPc6TRSbfZnceH
         MFkGB4VXSwMqDuAZ22iPPglmTcc7CCgcLc8elJqRIyhqyyBLfkjqP0ruZ1JlyoROAa9+
         a87JtvsdMmvC+FeYdoIk9N3Kl6UceRCvSuk3i4oCwxq8Or8ly3jZQ1vjhqsbIuItSwar
         sjea72iviChos8hp0ysX87UWslxipb++U6UKQFAG8jOcwgTsswCNrl+zxLynKpwM7A63
         R+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzQ3zvYzHWwuA3Y5Y6ZfOL2qntQPzFNu6RTsqIiKvjoIhQVPjCkS1HWTEeLs7jd8iReFFwjA4SFZhtLGHOuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwroZS2+f4opz3UpltS/jF0R9cnQ5ouGNLYPENXrWv8pLP8qXEQ
	irT8b9aEbikA5MBzGJtZtdrWk+8V3KnBj9QrLpvq17LS4Tk9WFumVN/y
X-Gm-Gg: ASbGnctpFy8a3Ky1jLxKOnswu/BsQo35nWozHYGCFKdpAZo7ratOMgapV2G7D8m6u0X
	Li55oJeirAQz6Exkg1YgeBA7e08pAomUh1CQ2G+kDuO8JGXt1ixcEy+rpv9+jk7kmNYgDh+tRml
	Pcv2vzEh5CezWS/on6Nq990DAlFH9Mj7VXOMoMTXZVBPZcMhmB16EdESCFeWSf9KNFRU0/Rvapq
	0GyN7qlWKLB4ixOBITiDzY2XQq3QoQIOSra5B08MJ7kKa4kDepyI+AioSQgnqzu7Q8pHTt9q44K
	HF0XJB16ORdrKNkFRmeNBXSLReS4FXrAhiyFxqNpD4UdYJyHzZOtIXqWbs5D5AHfM31gFozooZ5
	3B/XdwDWfHmyL4tLto3F+Xn1PB2UDW5rNRIE9uIu2yL5qmtucFb6JrUdz8PUtcA2GZx9/PeLZzP
	XJfwVwCPYiBEAirA80g4wTKG0=
X-Google-Smtp-Source: AGHT+IF7PKzf4wmRkdlJ3ART/JVas17yQj7OdtVc/pskXFKFVjPEcGqQ4iNAzKkyOOk75HL3arI3zw==
X-Received: by 2002:aa7:8714:0:b0:7b8:1a40:c47 with SMTP id d2e1a72fcca58-7b81a4010bbmr3446982b3a.16.1762991661744;
        Wed, 12 Nov 2025 15:54:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772fa72sm200624b3a.55.2025.11.12.15.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:54:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:54:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: watchdog: loongson,ls1x-wdt: Add
 ls2k0300-wdt compatible
Message-ID: <de06b5f8-1c57-4795-8ac1-8182be6175d1@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <a1f64f3d3816620b690aaff7b87162ba9e5b155f.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f64f3d3816620b690aaff7b87162ba9e5b155f.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:50PM +0800, Binbin Zhou wrote:
> Add "loongson,ls2k0300-wdt" compatible to the dt-schema document, which
> is similar to Loongson-1 watchdog, but with differences in some register
> offsets and bit definitions.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> index 81690d4b62a6..50a9b468c4a3 100644
> --- a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/watchdog/loongson,ls1x-wdt.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Loongson-1 Watchdog Timer
> +title: Loongson Watchdog Timer
>  
>  maintainers:
>    - Keguang Zhang <keguang.zhang@gmail.com>
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - loongson,ls1b-wdt
>        - loongson,ls1c-wdt
> +      - loongson,ls2k0300-wdt
>  
>    reg:
>      maxItems: 1
> -- 
> 2.47.3
> 

