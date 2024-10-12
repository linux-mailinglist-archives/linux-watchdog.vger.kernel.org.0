Return-Path: <linux-watchdog+bounces-2196-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE47299B5F1
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 17:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1CE2835A4
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 15:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00832745B;
	Sat, 12 Oct 2024 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY0BGE9D"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909917BA3;
	Sat, 12 Oct 2024 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728748031; cv=none; b=Hv8BCc6mtqM6GCmBMWOhiTabJ7bHQwf1oQcYL+iznH05CVfIa59kSHMrTrsBQ5hxbGr0JYIXt/sIjJMpDvFdGjar200LlPwyun7qwB45Nj3fRwD8/MzitRDqjZXhhF2ua2EYBiQZYBay/maJl1DNapAsc9d4OGPAsv2RgLF6/Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728748031; c=relaxed/simple;
	bh=BwFf6upCJNAdJ40mkYVPW+Ta9bTNXw5vnfXHGSPr1gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnqDaS4CmdHKU8QhSqoBIGGqEHI7ka0z17KYzLOIXcyGuY4aZ5NPVUyKQWyRxO/YHgLtO0nL6sosiqoFbEByx6YU0v6yApm0lNw9kRKJ4brCOjpJvKtSzHXPytUXq6OcD71Bb2xaJrdy9oRpeHBZUT3IwQfIAo1psizFPJBSWiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY0BGE9D; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c803787abso19968905ad.0;
        Sat, 12 Oct 2024 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728748029; x=1729352829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XLMUXamEtLIqeIpfxCxeP30iEHUYuhfBpCnBWVAFBd4=;
        b=mY0BGE9DGyTiUkTt6f+ka3SqxqdS3ylXHXE19dB5hm5Z7EhBNzWyA5BHQ9IEF99PHc
         2v4+WePFaV64Uj5Im9Gv5sw9zTYCoV0TkQhrbOzy3k4+9PUYIi6qlVmldnXI8qx9n1RK
         bOQYsoDSyoGkmB7Zf2kKB7O4/xLJ3RLCTFRbMU8NFjha8bqJKmENwoWqm0hBqP6HO0nh
         QchYPpjzdReYoQYPWVdkKI/EFCqPTviPgAKi7932OmsKTuwzv2gCOj2ZhVEb+sUTP+Ma
         6L5EPPkEHKoRR0NPYIKALbPCdCuB6GIkTLyiNXI+3wwiz6UwgA53gS4j/MXCSgr2KY/0
         I/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728748029; x=1729352829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLMUXamEtLIqeIpfxCxeP30iEHUYuhfBpCnBWVAFBd4=;
        b=wNO2pqEIddKCcIos+H/UsUaeOFirasP95c5MfO6MCSLDOp65VSWqXs4nD86CcGEi0i
         ozUfP5o3XcEPququrwCGXZwwCuC3vnTCzLZZrfptj8O6LKQJTBDKxQJwPPpU3SBlar9u
         Y1B4Gdt3RySPMLnRPi/TSLam2vnb+O76NOckkOW46/QfDmn7OqnRHGkDdBwg68A4X8Dm
         D3dT6oZzMka+TlOUmRkcmUJ9Kx4x4pAAbhjLPHH9OiQ+ipCfOhYlon54c3L5usLnPYJZ
         /FjPGUftVjRi14v5kq7aWOkHr8ynFZDNQKoSx7UeRf+gscCtpid0kS9RnZ7D4qC8jpGj
         hzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmkaiuRjnpCwGtlsKkUMSmg3zliDRKbF5aA70k40y4flQzkuH/V9XlMox5YLwLmTRWxsfXoHkuuy3S@vger.kernel.org, AJvYcCXBBDeBj/JxSQgXNooE0Kq6NNwFF9zipDEI5NxPjaO8Zd9n/V/e7A2uylLrhiN3BSBbfpOw6wCVfdPsM0pfjdE=@vger.kernel.org, AJvYcCXl6sdHtpWcSUw5zpTSUmtmlW38Ka3iZcwm4FMU2GQh77Y3hjy5Aetd+FuiyYdqDxvsIN5SAWkQ2xfASYZl@vger.kernel.org
X-Gm-Message-State: AOJu0Yydn551OH83UxPH5dbg1jresKNTGkXkVYIemELdDII//DhLWf0i
	H/SPp4K8Qgh2h5YOQfgMu0aJoGAEFuGiIlKCmfvUxP+CvybuJIwLQ+mnMw==
X-Google-Smtp-Source: AGHT+IH2X/2CraMLah4T1W4dj08Ekq5evuLcjvHRohEUNuM9leWAPTb3294GE2CUl5CU0PL0kxrQsw==
X-Received: by 2002:a17:902:748c:b0:20b:9df1:54d5 with SMTP id d9443c01a7336-20ca041887dmr82939425ad.29.1728748029359;
        Sat, 12 Oct 2024 08:47:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c0e75fesm38294595ad.158.2024.10.12.08.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 08:47:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b953d076-3901-47fe-a73e-f990ed1ddf69@roeck-us.net>
Date: Sat, 12 Oct 2024 08:47:07 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: airoha: document watchdog
 for Airoha EN7581
To: Christian Marangi <ansuelsmth@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, upstream@airoha.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>
References: <20241011104411.28659-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241011104411.28659-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 03:43, Christian Marangi wrote:
> Document watchdog for Airoha EN7581. This SoC implement a simple
> watchdog that supports a max timeout of 28 seconds.
> 
> The watchdog ticks on half the BUS clock and requires the BUS clock to be
> referenced.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


