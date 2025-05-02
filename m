Return-Path: <linux-watchdog+bounces-3416-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D527AA73DE
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365AE1887CAE
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD378255E55;
	Fri,  2 May 2025 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo5uwkoj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159F2550D6;
	Fri,  2 May 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192976; cv=none; b=RkwBzGvG/3YxlnEbyV6o9okDADFYE6xQ4Nw4wtRAmedsUZcFcGJyWCRRl4eLjKEWZxm25jXrLZbz6iLblmj6JFW64/gadhe240/f365fSLraKs+vqlyVqVG1wWysOtm3rEdSjI971V00CJ/NLFnPo1K1FX+xvaZeDn1D9Ibj3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192976; c=relaxed/simple;
	bh=p8c3MbtNwl5Pewr9e1GY1En7dmL+sTpQhoypuBvqU8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMMK+o8YEdOM5qxUvqboWPbUG5m7s2sYd+0tA0/2hPSB/M5OATAPeH1nsAQeprK9axDXMbtbFV4u7SZ6PI3Z6Lw1CMOvehlSVnRhjLxULW4V2b18qBKY9mWJrJ1Ce1osgoNho7ccaIwyJ/2qCBvg9TkgWkKYF9VzhZIc5liEZxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo5uwkoj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so1878011b3a.2;
        Fri, 02 May 2025 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746192973; x=1746797773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nLmaA5uonAzNRBDrxOb1nuL7jrpixwfGwlbOt4uTpN0=;
        b=bo5uwkojI8SFuW+aBaMKiCa5DKLHi5bcxIkm4EDBIgbpp/yTsgmWg3IXXdCohU199W
         vkQlzbLK2dcVOE+SjI0y4lS++cNKSrP92lbLVyDo+dDXh7N1UOdISp8Q2olpNYsCH2bz
         PXtOfik22PWDynQuDlZrZgvTXXYYwU1lqsre8tGE2WsKmuBwP8Jynui8Azdsb1nURTGw
         ZLNMgLQaCIZUEfuKXoBCtrAUg3eievk/WtZ2ZNxGATcEe9bySSJgcAoDNjf6k8cmM8yG
         YnhApKbGO/sdmJX5tdQ7J+mgiK71T6gCXYhe/unHfvuRNDtJigWNxNuReKBUhAon8aqC
         ezCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192973; x=1746797773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLmaA5uonAzNRBDrxOb1nuL7jrpixwfGwlbOt4uTpN0=;
        b=PZEshJenDFwp4YbvQx+pAuLTK7Hk8u4Jtle7BvTlXrlBOHRl2ly6a+q7FBd3L0HCUc
         KXfrq4sW6rEEPSz7Z+xrGsE+QrFmL8msUtDmvMG6zncuMejOmX7ZztFdlB4Q2FAAiZJc
         xygBwI+gvrOO0EJiCgbMpHLPbnYKqvf7V7NiENFIgc72Ap0S4nJf2oGpnmqm7f8WlQNX
         j3i935NzWATn7/mvgYyEA+bzOATvxxKg9M5nLSixaRlTjPVK3oF1/7u3aaGMzeIEtPvR
         SV10w8JC6tLB5jBu7dPUwAdzhZz6Mxblt9z/NHskYia+UJpSTAEUDYnrK9NSgabxocHa
         JSiw==
X-Forwarded-Encrypted: i=1; AJvYcCUGFYmKCi4AgTBxsqZNN0YGpjJAu+RNp7TOFh0dGlUNSQzP3z+97CuWqBVw5zVyznFtLtThAp+n0rrv@vger.kernel.org, AJvYcCUXVsLWrMRj9vxWD3HekvrzioBbY4puplpDc4aYQXO84qYagj/j/O+rnVEPLGceBeCTrLjnaNbpw/QjdACfffo=@vger.kernel.org, AJvYcCXVJx8O+oduRZg2ZksRzUGs12rMdvwjL4fZedkK3XqsFgfgZ+ijY49j502K5xqieVquIDOsNSFFi4iAIO6C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hAlYci/AUk2+ueGPBkkiqtSUACknVqPUneISyZ4PY906axdb
	qD58jcGOwV6hHwXvh7uCp1CmIWzl8/zcOKUgX3W7GxNLVQJIBZfL
X-Gm-Gg: ASbGncvc36MuyCemCnBDRosmxegBXJdmyFasTtxgy/z6iqWmygM91ioYRB+Ybh9J48g
	ix+Vq0tdwgS2B1DMeoQbJlY7lUCM427ymW6K/ri9eb8w4j2knVV1eYYSKsF3BH8yi+tGd/kDkx+
	gLrFjR/+Nw8qm9s278FAThSwJx6K82uiHKfqXo9zHQJnV3QbNtQldRu7i71gG0sl8L3PJjnRl96
	AEleWz9LbDxEZooBmUdRi/zZ6HJp51N0+QnVYcFlNeMIZIodHVnfLQSsZedsFeEVgGPO9c0jz5H
	ue067tN1rna4gfRyPCEYQRl5LHz8rjonBKewcFld/oM+dEVmjDm/oyXxhcrvTuBCYXGMsFFGAbd
	9FkzRnnL9FeUM/g==
X-Google-Smtp-Source: AGHT+IEOILX2vQR/myshaWH3Dh7E7ynM9LzzmUxm4Ukl2zos7BQpxW1zIVho4LN54M+5bqdRs8dsXw==
X-Received: by 2002:a05:6a00:2e05:b0:740:595e:1676 with SMTP id d2e1a72fcca58-740595e2134mr4205978b3a.8.1746192973492;
        Fri, 02 May 2025 06:36:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021067sm1544064b3a.107.2025.05.02.06.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 06:36:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6d9f62c5-64f0-49d1-870c-d13011d397fd@roeck-us.net>
Date: Fri, 2 May 2025 06:36:11 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] watchdog: qcom: introduce the device data for
 IPQ5424 watchdog device
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/25 06:17, Kathiravan Thirumoorthy wrote:
> To retrieve the restart reason from IMEM, certain device specific data
> like IMEM compatible to lookup, location of IMEM to read, etc should be
> defined. To achieve that, introduce the separate device data for IPQ5424
> and add the required details subsequently.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


