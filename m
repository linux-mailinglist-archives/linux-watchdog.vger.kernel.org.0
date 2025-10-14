Return-Path: <linux-watchdog+bounces-4387-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8790BDA2BB
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 16:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 917924F98AF
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 14:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ED72FFDCF;
	Tue, 14 Oct 2025 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqVKeuMz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977A2FFDC0
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453808; cv=none; b=jz0//HquVlp5CxZD5SWSt60hW9fNGvpMoqHsrzJ3JRBTji6e210E4pM9vuZ4WDZ7bxrn6Bts+tlh0965gj7DSQOvCx60RvXRNpl/dAi5bjUoCUHihtA3zP2beM46ykwspfxaKwBe4GZ7s8DwSgMvCbp3r/pSQ9WUFQ8vfpEpKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453808; c=relaxed/simple;
	bh=8iKGld3gcMfNcNnZPqxIDIKgD8xoq3CM10GkCPHzaSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QW31TiMCxO1WC06qEiNWwlAFHe3VOqtvZKuvVy23quvhvYdLrFnHgUMnBdml5m8CAMttCtLaZYXxekVsPgqFSapQSXsNcYysiJHRzXFoWD+FuBWItTqiMnl7SAMZ1YLDmiF4nhCTPovbWNNdRiZLBDe8+xRmXcCNt1Hz4e1pURc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqVKeuMz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2698e4795ebso53358915ad.0
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453806; x=1761058606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IdzaK9apf88+GKRsm+oIdy934yGVJy1200lhonGLycc=;
        b=hqVKeuMz12GWPJ3Z+crdr1Z+i1WtRvWWLQlRxCF89yGJ1aYM1DZ3ohYeHXat5RpVaD
         DU+FTzJE74ELHYvW2svgzmtQGhDWN8yUPNWZQuTGdCZa//7VmP7iREIYLX0z1UMyIyPL
         4gOiGGZ8ou+xiDVOOq7zWUQnmYKzGb/uaba5gMSqxvKvczJXiuGGhGrHZKiEJMy0ejON
         TNNWydjpKcasRWdvJtGjpdRDPfFVF9poKKzO8kMD+koRPQts3GuEcoRi30BMjtdcZP8I
         r1KPzWyZM4Jyqp/4cHvtpwQ/37STalJMiMBBu7rNFHR42qB7hH13zKjUflvrzq8DLUWM
         BTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453806; x=1761058606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdzaK9apf88+GKRsm+oIdy934yGVJy1200lhonGLycc=;
        b=v71dO46xRhnH7pznVnmfZ53HaL9LylWEcebp3ntwK/32kCsBTLTMSXnxDHwNoMAT9a
         tQqYjcLBAHK8/iVK21vgNZiOjX5dVFew+z6ircgN1ibmsjuReSfTiEjgElLxaRAHDM7B
         KOzuNs6fPkuhPpa1bNj5ZfdtkR50c6MePIreqpal7CpVXDplj5jz+sAhQ7c8My+DESg4
         0enX77JmBeynoNMo6H7h1DzuaRr+Nhn78wj93McHzM/q1gRX+oOobtDH/mm2E45EXeee
         vp3zQARTdwNH+kTJoD9PaIAxDH9sFue6vJNQEyMJJiRqRRo7RFmKcE9pjjW06Sc5M39B
         G5mA==
X-Gm-Message-State: AOJu0YwwVTD1wcFjfU5ghsQX6Hr1YJoTu6SWMq9+FaWBGl/87UFIDx3S
	EihfBZPDxjEhyhkcVFsSnb2bCKildOs1zpsW16RDD/8Zpp2T/WBVBK1p
X-Gm-Gg: ASbGncuFxWum+nDHNqT6BvTGMu9Rt2/XY/eRJQ7FhnzH6OGpsEXLMJ6CY16YHSjv3SU
	V1jqwDCVfjuDBxLmyy6UoU7gX1rIfmHToULRCyVp2FvFa1lhPmXU+Lin0PEJ/19xAvpS76RbtGD
	taCeQkuUnRnhQWTJ/QLVohHzcFAeeDN8PJxdKILnYhjveByZCOksS8zu9c4wGOxQYmlixqu7bkI
	0t3DwPn9vwNd4htDveHbfk87/fFwJPXG87LM9csdO5fSgJuBydEH3DGmOHSkCxvfEGInNl9Ln88
	/rpOZJouXxL5eYKybVwob9w2eDJCywHG2Gz8+TS3Q5vutT0DG8ZLlteP6iNe18ssEeXQ6R+vpno
	WMThvEDY6Q7vuBdQKiV/GmnA4XNNQPqgNsteeIs0e8O9BqR8EMu/zoDG4dplvNmlVb73MzMOZx7
	IRDju69WSuTXkmhdZpbLtySztT
X-Google-Smtp-Source: AGHT+IFj+fVzwDYH2/aRoUhxuSqaOEHAnllbtcxS4YSUx0epDNuTRY0qJYDLt0RViAs76TbbJ+PpUw==
X-Received: by 2002:a17:903:4b04:b0:28e:80d7:662d with SMTP id d9443c01a7336-2902741e4c2mr273573785ad.58.1760453805781;
        Tue, 14 Oct 2025 07:56:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc10sm166667895ad.31.2025.10.14.07.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:56:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a3e84469-8108-4dac-a32b-c95de500af7a@roeck-us.net>
Date: Tue, 14 Oct 2025 07:56:44 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: Convert marvell,orion-wdt to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251013213146.695195-1-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251013213146.695195-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 14:31, Rob Herring (Arm) wrote:
> Convert the Marvell Orion and Armada watchdog binding to DT schema
> format. It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


