Return-Path: <linux-watchdog+bounces-4375-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C4BCC98D
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 12:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A88564E4F5F
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 10:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1806728504B;
	Fri, 10 Oct 2025 10:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR8PEdRC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894EE283FE9
	for <linux-watchdog@vger.kernel.org>; Fri, 10 Oct 2025 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093336; cv=none; b=SixfgVNR1nIwu2AlPDEof9ibfxijw45MJ42SJabViSJbfA8f1CEFh3QylnMzGHlDVaNKGAxqD+C7PYhOwadnVjND1ed6k/XhMTWpj96VspA49ja1bkYog+P262Qe2ob+rgkVgvLJy/vaUMyezk9MYDvjx8kXRiUd2swe/8UWArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093336; c=relaxed/simple;
	bh=lYpzXUJGIPqLiDVqIx8/ZgeeX6xADxsThjAvI10s8A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WJSN+awKFCNfZ4xNE7hpfG1dv5oS0xrBcovcufq9VJS0LPY7SFlPHpNOCDqwNPtM7IGLAEezO0ijySYBE3L/Yub0Kcfbdp/YhT7OX6D/ANQj3stE4qQFDXFgzPkMzeE9idTleyICJMYG4HXui177lTk9e4ZcjmhJx5gqo+m7alU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR8PEdRC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-28e8c5d64d8so18273735ad.1
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Oct 2025 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760093334; x=1760698134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x2LiN8aGSeEz5/QEAPT2ZIDR5uamXQ8YXQ1ZPBqL/90=;
        b=eR8PEdRCTiTUJTQOAwDkw0uOiOqkF7kh3iqswnjFr5hictujyuKXtNPRp4qd+kP3oI
         8ICjWlFXxY2YIqbHwodbYhnFoAlGQMVisCefWVMk7/PK2C7EialoJ+W8FpJiJTBcViyS
         XqdmuIggo5vadlquvcEa3hd2RlmUm/DYmYhAqrT4wRfb3I79OmSwxsdjFknh0diO05RG
         lGkisKaSc2hNleIhor1WGl+sfAEZ/wxOBEI76JmdSVuze+augrjYBbUNV5wnzaJVoNIn
         FLXJPqZmb4mkSQReAD13lRCZi5CIAWDnm4r0tYPF1uCerzx99a2QaVcRqiPmtPEZfFJm
         nEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760093334; x=1760698134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2LiN8aGSeEz5/QEAPT2ZIDR5uamXQ8YXQ1ZPBqL/90=;
        b=ugJUANnecx4C4wBa1GZQpomNrkyNsgDIEBuWe/RovQn4MMeyNx1fCelVOrd3tIcjj6
         JfHNm+jsLhHcpOBJQ6jJ3TwjYeZSmLlcroxT5NxkM/DBUIORwowXOeVDXT3WmemN5ieJ
         BfB6ZkmlGC+sts2l//yXCBL/veJgpJjzo6FRiSNIRRVT7zEVWscDmXV7vjOhJajn/zH5
         P2GLpEjtAmzAELSAmahG9Niank0+NaNIVjr/cjhceJ967mz59hBkttNgZ4IV45JXLRP5
         9kArciOWiovYxnvCRt0j+oRuST7BzAjLH3S5XL9zz8dXWKd3PJBG7mEH4fNpF/iDQAd+
         7suA==
X-Forwarded-Encrypted: i=1; AJvYcCVgSWTCd6GD0ftREzHD+Sd9gbPie9Zix5AZm2kPUA5QOOhj4iZF7+E3mxNydmLduTx1XtMi2fs1KYJ/+nHu6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUam87st+H7zZ+amLv1X9YFFeHKWywWYu5dBV2q1og4ya6trVE
	wqXwi7vgvTyjLnxqKHFlxtLFPpILmAceRMYhCIzVutKPsFqeZuiDgLoS
X-Gm-Gg: ASbGncsWR1fS4tSqoUubdCLDZqYLH5NOxWtBxvt8mU3BCJY3qkO6iEwFNXZ47GCnfCB
	VuQe1FBeKWXpx22SKfl0L7I1Mx62jRgOmtvhDVNO8PetRmt4zfKpVQbeNk1aazGYw77stMy3b3B
	eigXqRQjuNP9dStq6EG5lql5ws5JBoEbv7tZEb8cMaq9Kjjp3QXGS7F117x31AHBZts4nXD9iNl
	LyJc5Ecc67xXJ8g2N2bcJBM1aaVctn2nYE+VR06lITSF7YSplBgEI3NmPMbcQEogeAn4FSPIlGB
	AKtielBzwm0MkRjJLciIewdlxuOlNrsC1CQI9UkrKuxchV7tAHAJrjACFqINecWeiH0M0faUDX3
	h9rBzACiHfnawrGfrzYsWVPgqhiFvkrwZh7r8xHlenizulir7diQni6yHBAhfWsbSTTCAikTksi
	1PcHZnGokUszIbTA==
X-Google-Smtp-Source: AGHT+IEwedOJdX2C4dcT7YtHIB9g10cEcA1KXeKDB3iN+o2qBogEjJkFDAFvSZ4Lz3eibMEDLOuYqg==
X-Received: by 2002:a17:902:ccc8:b0:28d:18d3:46ce with SMTP id d9443c01a7336-290273ed885mr134399495ad.31.1760093333627;
        Fri, 10 Oct 2025 03:48:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f070basm53936325ad.77.2025.10.10.03.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 03:48:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9e179850-56ff-48bf-8cea-ab5895b6f935@roeck-us.net>
Date: Fri, 10 Oct 2025 03:48:51 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] watchdog: aspeed: Support variable number of reset
 mask registers
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
 <20251010080315.816628-3-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251010080315.816628-3-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/25 01:03, Chin-Ting Kuo wrote:
> Starting from the AST2600 platform, the SoC design has become more
> complex, with an increased number of reset mask registers.
> To support this, introduce a new field 'num_reset_masks' in the
> 'aspeed_wdt_config' structure to specify the number of reset mask
> registers per platform. This change removes the need for hardcoded
> platform-specific logic and improves scalability for future SoCs.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


