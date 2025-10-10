Return-Path: <linux-watchdog+bounces-4376-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B947BCC99C
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 12:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 161B34E8F3D
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 10:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F480285CA3;
	Fri, 10 Oct 2025 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwBtQEWP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA7283FE9
	for <linux-watchdog@vger.kernel.org>; Fri, 10 Oct 2025 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093363; cv=none; b=ZIcLIusVQ4ddJ9URsaJ9TrDr59YQSkt566hoL8Dnd/QqsZAHSx0+LOBUs2x+xUF7EeEFuex5slvDPAhAzF1ocGAknGmF67oGaH1gz4K+b6jgJ0aTId7l2pBre6wDLfcZyhTEARA/7polpxYoUx9+8kUeixhy4TkSWF9TMDiybi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093363; c=relaxed/simple;
	bh=ralZAVCqY4hET6eaJQQ0Cr54ZSDAZe+eYJqL/YglThs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mD+Txbsy5+yYz5zPUOtOpiUqOHzUTHu1hYJuIUIBYeD73WMHTdyxXgNkiPJ2OytMNjmEiwV2B516sIVrJgX2F/Xn2WnqbPS5vbWNR4Q/6UfWd1Q3+4JvZqb8T6BU4QAWrtFytmskY+Byt15pF+WNixlldYY2T/AEkS+BVwlT2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwBtQEWP; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7930132f59aso2718095b3a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Oct 2025 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760093361; x=1760698161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QzPIUE0kq7RazblEJidW9b7e/wLqz9BuPeB8RaG4tE4=;
        b=hwBtQEWPZNgWCB9Niwkw3v1fIL7vzjuegfI8dsMjCbWZYFs18G3p8xyt5xXFmOiq1E
         VZtWg+KmnIoK4Yfw/EDOiPpgh7pbLghDhNOrzdQrt9rCVYmnwwUmQ6TsN5pAqtsnjp8X
         DRv0fMYF6Wn1U3dQBHckcJnmpi5388o7N0uQtDQ0/uO7Xp5UiOGXH1V8o9dhk647sCqa
         LrIFvf104QJ08sn5jw23rL0pBLjrfwlSv6yXLJpt9GrOCOM6MQqP02tjLNjuiHB/08Zl
         jGlXjq2oS7hKY2MbIrv+DyZixr30gJwJwcluxocS3g3UOF6+YCZ+E6iG56gTw4i0ojpY
         EDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760093361; x=1760698161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzPIUE0kq7RazblEJidW9b7e/wLqz9BuPeB8RaG4tE4=;
        b=t4bLoXBvoBcqKUUw/CWgTcJ0y8olOo3qr/zgC5SISf1hDtdnUeXMeAI80lNiO4OkOb
         3cjaaXrGTWy2PVW9wzLA5i4JrIb0V7xY4H0j1bLWcn4mdL1h7cqTGL1miCvlXFr+1RCI
         HUjmfK4Z+VRmkQI3jsX0tPOOAkb7VLvpJ9oP0bNoTZLC9qjZNubOs18g5CKBK9zC3vQW
         xtHiB6OTElze7ddn1+2yEkOoPo2VxaxXQTahp6eZpNE4E+9+x3yugRd6zX6R4B0P30+D
         Dz1GzLIZP+JfYiD3YfSRLUr/6coAWrbxAsLySdLSBcHibzscGmsdWj106O3JUckDWlJC
         Z8kg==
X-Forwarded-Encrypted: i=1; AJvYcCX8GlsWVJ+NevxqRrBgo+T5nsyCZAg3QYgjTDpZEL7lZ/bzSNTQ0+R4aAUXM5omyREfn9l3GN22ixwwPw7SlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXmuYW+B5888P0siS3AxgHwmSGE5FuzjxTZomlsP1KKr/fYTM
	m+9/7qs2FY60JLLpwxLX/iJyN6/AD5Go+x6bgJd3YN8/quSTpRoQD5W2
X-Gm-Gg: ASbGnct5BYZ3sq5SvOYgvNEMvjtl940pbeFKj7qrMVRp0jNISqQ58oS3hUKKAFf03fb
	cUQNvAYyXgnl3ndOy9omrBcK65u8ouAyJPpFk0aEn2WWyXMBNzxA0HzP9qAF5aKQnyBTWuF2DHk
	Yfj7LpP+aakuZGwt/uG858w5dSD/w4onUxr6xrLNnPyLjgBFyVVgv5hJF1TbZMDyjC0p0ewHN7E
	/ozv4t0zZJ7bSY3WMEZsCH4ZQPq3cevKkKGl+bF9oVPG0CoGJPF560RMmabLvUg/yAlItGWQAOH
	2ngr5/CbBPwwHzzyFt+NhfY+2BIDM/3NHPt6rDlhoPb1uRzQKvFlkUQNhU0ahAmieV2R9JBaxM1
	SX1uH7LkzgWmhTZMi6JBGU5ALay44Nz1VooPU75xDiSc7esV6bMP1QwNaqlXnHxVXdHGxu9jm+7
	MEl5L0cfDk8H2VZg==
X-Google-Smtp-Source: AGHT+IFBvTAbJQG+MxhyANCbjpJn05Ip49+Cj9nha4KjK9n7ztA6cSQ8VpgOYMJmhMkKmcyk9pdApg==
X-Received: by 2002:a05:6a00:80c:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-7938723daa6mr13371334b3a.21.1760093360826;
        Fri, 10 Oct 2025 03:49:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d2d2e42sm2508787b3a.62.2025.10.10.03.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 03:49:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8424b26a-e267-4481-b027-b372700ccd0e@roeck-us.net>
Date: Fri, 10 Oct 2025 03:49:19 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] watchdog: aspeed: Add support for AST2700 platform
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
 <20251010080315.816628-4-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251010080315.816628-4-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/25 01:03, Chin-Ting Kuo wrote:
> Add AST2700 platform support to the ASPEED watchdog driver. This includes
> a new per-platform configuration with SCU reset status register at
> SCU1_070 and support for 5 reset mask registers.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


