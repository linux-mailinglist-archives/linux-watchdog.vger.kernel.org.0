Return-Path: <linux-watchdog+bounces-4807-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434DD199C7
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 15:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61851308A406
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 14:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895612BE03D;
	Tue, 13 Jan 2026 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbsdQKEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsFyRQI8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B531D61BC
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315589; cv=none; b=YWeXNwaeSqVBVtqETWxz0Fxa5AJHA6QEHwv6Vo56UhcTSHI0hnSBMT8tlhNVXPSCfbAW/bqHmHdPMTInBfO9WY1XUjcllrQIDdjsexNk08AeF3K4Ooe90YJzVKwnxbDjhWwLv0nVdCIHXsWBqP2+IkkYAY1QjJFIVbVjtWX7GiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315589; c=relaxed/simple;
	bh=Ley4TN/WBpfjfXwNQQF8JZFqf1YkvsD8BswtDJtXY7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgXb0X/ykOwhzeWO2eGUchTV/h1OrRKBp2Ovf1QbDYCdtdunlabl6t/p9IzZPFXUINqFbSP15ZeUyzhxuh0Fl2fgzR6JStauqjX96HUAKwkK58glkOoQ62sCpRFFcmInc58C44J5Vij4oLi8Ngwa7puecNd5PUnIPMmdk2AWXKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbsdQKEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsFyRQI8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCntHD3734990
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 14:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAagwHcUARdoqFIcNEcujNUp+tDJqKcgxSn8pTRqOVY=; b=ZbsdQKEx1hXhmSuq
	BODG3DYUvwgSAKZCbIWLsOq6W9A2UES+SWKWROiBJaw4Dg/2SvQP2K8go4MJlGFb
	AP/zrx3P6SeFplr3QsmnqXcESltYnaiqbHG0ErDstffvLZ9f+PROWVFfqCxzTMdw
	73nNvVl1jDXVFaO2ts6OCF+tMREeMy7yk2eVmpouk5Lrkexww/YNkxVosV/1Tc7s
	x4CjFcz9w/qasGpBOEyxAtJXR7PKDjLBdpWzsG68VevWP76OijUqkpM+ZEglYxip
	FTjZ76fJGBCKhkwSLGvKf/R3UBarybJw7IW9QXlzbMBuL6mn9A4yObu4RUj0+Jl5
	E1OP5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng879kvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 14:46:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52de12a65so3590585a.2
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315586; x=1768920386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAagwHcUARdoqFIcNEcujNUp+tDJqKcgxSn8pTRqOVY=;
        b=PsFyRQI8FGlCNRR2FGA0LH+JjGlZVee5EK/vQWxUPSdoKADVdhHMghgRI1fCaZ8bBT
         Pkh1b0dCyBIWMRpklURF49NeYFsbKIaKevlSaRI0mBkxuDoCHVtCbsw4p/r8jNUPf4sq
         1po9oBiyisTPD7Dv8auIOrgBLgt09CC8cYxGaj+jQOHyhgOpTanJy8fZJR7mZDmgpJai
         vNpWEKWPhYGl5GlPyoW6EoVswa5QAlMA2PgDWzDrwGVP7oniLUKFeRW4pA7bwIdBcuXg
         Gi420ktCrd/kf9LC/868QCZvks47MWB/H0ens3BANYiF7EnfvyetrB7t5CGD7c8rsH5f
         fUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315586; x=1768920386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAagwHcUARdoqFIcNEcujNUp+tDJqKcgxSn8pTRqOVY=;
        b=eAGVgpobkyzGxqsCqgTPBZbzRP3TpItS5AwoGBX+kWS9aR9AgK5zRmkRGbXaw0qxSu
         jzfJ9gIzgTGgJO6d294JdFWCFN7Z+bFD+XIAZMsmqJJcggqey18oME55H1nxujALBvVM
         47O5xhApJGDKty19tHNsVMWRg+uXjLvo0ZOQC39Id1SLmzOIR+hqwmnwl9227xhiFFUa
         dS9lHgcln72OmsF6NKpfXoaJtdjA6nI0i2OIiPDAvQAI/qzlkIcraQQ/gaFc4khakXS/
         b+N4zVqGkmFj+0CF3TPOINSpXSq1Z7CfjdWnfOEo937+lG2/tOcCQFWAa95DRdYogaxt
         bx1w==
X-Forwarded-Encrypted: i=1; AJvYcCX7Mfzm9WEKWZ22ukLNmZ5HXET8f0k5Ac8W0lBkLDqKRFPoDFlOHyNmJRgkHetwFBoOIepfqCZIyaWtY9QNZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuLW00LhEneH95KqNMnZwEmS0QKXbIcujCJbwJhRRRFQpsxUBh
	BNvxPiD72hmLW8oHdWtrmdii13r5G9/Cad/TJiDHsumudXA2OtZueO/iBMwsJ6DTvSdS3u16ez/
	hCZah4OCjCn3G6uAfSzHds0fRNsAvvl0h9nPFziSymBeZBbVtF9isZNHe+2gL7+ly4EKDMw==
X-Gm-Gg: AY/fxX5uWOqQ7uSLaK2tkmenCrXVWO4T3kG+rIhEjKxL/26QPCAHlYPE78K8SMVc9q4
	yCPauH49RzJcE0w6DR28Se2OK+jDw3xiD1JVB7nba7eJYX361eNu47NmX3ge+wwDGuHQqNgP2qP
	zKNjJ/TeS9oEcrI+4Yl9o5ScmaKUARNyITUrEYe1Obln24wHd+jhWOB/tDtyu9gZu8bN1aPrFlR
	vrelXGWv1+MKHjsHyboQrV83/mVA1l5hNu6+l5P5ZhlBH+f+1ZdSgkhg78lbCrRTUKT3dGf8Wmu
	pLR30VXTYDahUqbDTyYxp0tozJ6hrFflKRF4lch5EbFEi79ieR3DZWrv9unMVHZgH228Lh3A9sM
	NPw8EbPmeQ6dzYq2mdviVi5Mw4nD97AnF5eCRINVDT5Rh4M4nQIT+wFOJBtp0L6ksijc=
X-Received: by 2002:a05:620a:f15:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8c389410414mr1963881385a.11.1768315586410;
        Tue, 13 Jan 2026 06:46:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0CQMntguZ2wpBSdo9dp/0boxYiDEzJzwbPhG4IU/Z1EDOI3Nnfp78EbLZwKyIhpC0AnLyNw==
X-Received: by 2002:a05:620a:f15:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8c389410414mr1963877685a.11.1768315585881;
        Tue, 13 Jan 2026 06:46:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be642f5sm19972741a12.20.2026.01.13.06.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:46:24 -0800 (PST)
Message-ID: <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:46:21 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
 <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
 <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfX5B33uvIeYVaw
 wWVGxat/+BaEKVfGK1g+vgItxj8I3XTd1jNPbxoUeV6UlrRdg5w3AG0d7Cz5KUVR5DDbvacYKs+
 wB1UsPBFf4tC8xUqyGf7kbuSdRgSXGWIiRy1WcXy8YAv5V3Uogbbpf27xAW00mdO18I2L0VgdGp
 2y/nn8fd/gRJoDF7V4dQ2rR7WtbHZrm/56Ce8jhuG1S9Vn0mUWAwzqViJ4Oi2UqBIFYeTdt9A2M
 4Ln0pmKbJXr7PHHSjMUP2VqRwFTJBlITsABNXYOsIlzuPWNNvFzaEd0JskJTF+wocbUqqD0ty5/
 iI3ILVLcpZf59o5OfF35lbXkqKC/uFcNSkNihJlA58wyuqvk7+IWxwNdx/jxLdwhxrNMMdzmIzW
 /z8cfaf5NTg/EytlgGtWKYrOVCrbTV9nUa3d0j17+TsIbtNaTO/jgqim3e0utPf1A+rfCixrJJG
 E92fI5wZqkOkrsluyiw==
X-Proofpoint-ORIG-GUID: EK3_uWnSsvaqJ0QeDlWRySMOD3FhaZn_
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69665ac3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0dMHunV1XF2N3nHORDIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EK3_uWnSsvaqJ0QeDlWRySMOD3FhaZn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130124

On 1/6/26 2:29 AM, Alexander Koskovich wrote:
> Hey Konrad,
> 
> My device's EDK2 should be on 'KERNEL.PLATFORM.3.0.r1-12700-kernel.0', unfortunately the device I'm working with is secure boot on so I can't modify bootloader to resolve this issue, though I'm not really sure why it's happening when I looked at BootLinux. It seems the hyp dtb handling is the same in both the "dtbo img valid" and "dtbo img invalid" cases, so not sure how it's only happening in the latter case.
> 
> Note, that I do have a blair secure boot off device that I flashed with  the same tag (KERNEL.PLATFORM.3.0.r1-12700-kernel.0) since I noticed it happened to support the chipset, but was unable to reproduce the issue there, DTBO gets applied even with a basically empty base DTB. Guessing it may be due to some change in hyp with recent SoCs.

What I had in mind is that with the sources you can track down where
the issue comes from with a fair degree of confidence.. if that's a
Fairphone-specific issue, maybe you could prettyplease ask these folks
for a BL update somewhere down the line

If you still come to a conclusion that the hyp is wrong, we can accept
that workaround..

Konrad

