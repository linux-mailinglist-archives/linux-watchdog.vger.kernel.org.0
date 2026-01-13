Return-Path: <linux-watchdog+bounces-4811-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA7D1A616
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 17:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F04143029C06
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 16:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA8A34C989;
	Tue, 13 Jan 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkpjmnt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtFJ2GMN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1E630FC38
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322876; cv=none; b=InspvAHrKUOj+U9mPB1tHzSI5g/1bZq6SZ7XjfVMjdHIj315M8XDXDNchYNoa3XmIv+p71xfFm4bUt/TLKsIRcKeavUQglszwIxFUIBfJkC+G4CToF63fwAqt8sJqyxEqnxR+umYNdb5fpn/NZYbybheGCe75ZSlttBXehqHvoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322876; c=relaxed/simple;
	bh=RJmRwTj3K/zyjI/6ibebPVP+Br+k5iGtacdim9Ql4Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cG6NPxOna3SRDKmoB04po1ydN/fc2TcNXIipJFP+dtV5NuHFZjLMXFjQw39oQ9t/3aNu/sgdmdsZU4hzK2QHwJKMXCDsqRHgz3pKk50oan5DvpU4my7yWe13H47mGFeT+3H8jZj6Fmz8NjrD+0003q7pFJaO9Qvx2/G7qT91YV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkpjmnt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtFJ2GMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DA5koh3798457
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 16:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MTyn2KRC9wTRTEtP9zy63Czm
	v+1kN9LAqhEzCYvNoo8=; b=hkpjmnt+L3ZLGS7kOJWexB43k1nkIpfyucEh8WlM
	GnP/1NSCrQAZiYO/G7L2spmYkfGcsL9xmmsJ2gKvVrX10BS8MuVofha0Ruycqkmt
	8iQjE2ocCAVSZPRW+ZulDqKoS0VXCgG9yNNXwBfpOrRiwVgG3NMjvIF8yvoRGD+4
	lRaJdB1Pwms1dO8aZtJ17vwiWJt0LshmzfkKbv08RQJzVh97nDaYMasuM+eK0tWi
	HsJ/oxxKp85vlU/bDkhA3mfMrFwc5p54kTKTxp/OVvwJcYuYoISjetWKtY5smMAx
	4jKm9SJE+RCoCcoPvK2n/k0C4ljZBiNTj5B9Xo2ALpTvtg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0ds9td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 16:47:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81ecb6279d9so2855576b3a.3
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768322873; x=1768927673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTyn2KRC9wTRTEtP9zy63Czmv+1kN9LAqhEzCYvNoo8=;
        b=AtFJ2GMNEJ/YFL6IjuOw8ONMQtxlZI/GqU+mqdxDzTQ9nKEe72MA+tiM07nmXl+bP5
         TVP5mjR5l3JYli+WYVQ9Mh1Lb08uRkLMNZciZuBvvh0bkEfOBaS3UnMd8eysemUb5eq+
         TeQz6+NBUvhfVhNJWnGvDNGfVBTjg5+8ZjiFftGuuxp0kZAmj9wFZSNA/3+aioyTM1di
         hX3SdkKLp4PjiVbyub9bJFLghtKwI+Zbh7+B22eDWyUIMf/zNPqgyumsUa4f7+1lkWfs
         4ct4q4+rmm0UEZzZTPB5WYLEmfz/+w1LyAzgjY6jAUZ2tGRfMyh8i4/Bk/wvIurU60x4
         VJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322873; x=1768927673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTyn2KRC9wTRTEtP9zy63Czmv+1kN9LAqhEzCYvNoo8=;
        b=ZueJnCaAnFN5Bewz5PdV3s+ZOjJg+knH5JUKZ+i1XxFjRyg/yLxZxk1j+Kx9BVWOh7
         PYovsEWIGGoXuCgvGYQVwX0b/t3DCCEeQgCnZ8LtZ/wjSB6KNjkmEYkkwKxv/GGenE9E
         Xsq58CIUXHNL1Jqpka3k8SwByODGCIdkmQYSGvVF2in3RhMw39+/kvcLTaiZHDKO+VpI
         EPhUvLiUXtiuH3Tokll3GFI3gukd6TGVAMhZBOAfGl+O6bLsxOK38fGv57eCEbQynRBi
         a7G96BJ2iwl0OdtEWWMWBQ59CQtPkAAhOhS00SkFaToUp5w79Q4e4gCEedxtrfTmoZrC
         4//g==
X-Forwarded-Encrypted: i=1; AJvYcCWeqgMWqMKFwml8Zzxtu+3fdLkvjJcije65lTy7QjTfq2hEbb9Cu7VAqc8pE7UBdKNy9wuFGFZ/J7Ll9setTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztAJkFuHU8hYNl8t6rS27ZcH1XUsaZS2M4BX45g5YSkDIdJh0t
	Z8gHUiRxRUHAzP/jSNYw+tHKdZ532Go950qXV3HNIMBT0Wk3SCGvMTdw+ChkclFxo+WmlxMD9S7
	7wpF1WQsFSnCIby/gYTVMtdBXiYuVl4RpeJBVU8Z5R6vPiounBmmsgCQg9nhg0s1faRtg2A==
X-Gm-Gg: AY/fxX734k9vs4SHv1cZgWbIr2Z6udkIfq7xLaU6chJldpXoYcX5JQvJl1QeIyrBmOR
	XduIQAccZL8DgNjSo32SPko8xU7+fkp6DyR/K9iM6atesLvj/dZC1nhQa/uqEyzNVjWecEdCZSL
	ZWZ6Z6vXwPf6E0FjpXJBNe9SjDu62YIQvmtjh2jJn4GkPnHhTwL8NXOTNU2Du1NNCAW99rS9iOq
	9vNY3PEcDq/IRb+qlmiVX5k4TrVob7MlitCwAY36lRkCC+T/2NObN3OQajbsZiMTcee1kGgVn9u
	/qeXTIhIui5aLInBhZXTgl66kSMpW9ffg2SLPXlm78c59bZYkg6qXlJZkjcIjIK+BkjniPAnnvK
	KDAF1EXQSN9QcGBiRMFXoxXHiPMhhoGw9gDxR
X-Received: by 2002:a05:6a00:408c:b0:81f:5f49:690d with SMTP id d2e1a72fcca58-81f5f497111mr5738449b3a.18.1768322872804;
        Tue, 13 Jan 2026 08:47:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZlMg32RqQTDNGfAe87X0hkNlc6WB8E1XbLMp5bNhyiNlI3t1suoaXs4tBsUJc9iAJ0den1w==
X-Received: by 2002:a05:6a00:408c:b0:81f:5f49:690d with SMTP id d2e1a72fcca58-81f5f497111mr5738428b3a.18.1768322872128;
        Tue, 13 Jan 2026 08:47:52 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e3eb854e3sm12462968b3a.5.2026.01.13.08.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:47:51 -0800 (PST)
Date: Tue, 13 Jan 2026 22:17:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <20260113164744.6lwz6oox6pdlxn7z@hu-mojha-hyd.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
 <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
 <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me>
 <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com>
 <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me>
 <20260113155821.7iesxxuf74ncr7ue@hu-mojha-hyd.qualcomm.com>
 <a7RkLrctXwaW1s2WCUMkvMMk8imG2fGJBHbdsrljwgzYuSEpgRXlSRLrF4ONtCMxlT6hkHsvALfEOps7KBZWX1oIEMh-b9PHEFLqeC1CTI0=@pm.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7RkLrctXwaW1s2WCUMkvMMk8imG2fGJBHbdsrljwgzYuSEpgRXlSRLrF4ONtCMxlT6hkHsvALfEOps7KBZWX1oIEMh-b9PHEFLqeC1CTI0=@pm.me>
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69667739 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CZwxL6zrGSaLU6OBQ7oA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 5QrI3LBKgncv9dL-iFRKhnp7XMCBmWb6
X-Proofpoint-GUID: 5QrI3LBKgncv9dL-iFRKhnp7XMCBmWb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXz3R1Tq8z54aR
 /lfcmLSlvIWrsHjucaUsvM3axWivr3OD0zyTY/n5jU6bi2sXsvfJlE2D4IWqfjyNE/RtnI0i7Nw
 oVvfAEUgJIRtf6x5joSfgzWx+VnvqC8G6L7rfSIpDYGYZ903c6w+iY4Gpy6/oPD52Zx5w5P3NSu
 iagx95JBVAxrC990FBMZNFFKWrXJboeRozSChSnFQ/RcmbdH28Yu22Za8z5ovLtUxtdJ4S8otL3
 mdJO29KeZIpe7ieCHiAfizqvZXFCYL2J+U4RsMBoMZtNv+JW2tiE0ISFzNyYkgY5aIN4xmgvc1r
 k9kLinbyN/1rgKyF2lRVILOgMag6iXYfcQjWzy7nKHRKNE/cazvr7LQwS/w3ClEYafcs36Hqwzg
 B62ToFAnUa+MsYqO08MqUokJlfLXW7MxZhR6L8bPzz1Q+9qTXkHNGLdbqRfmSffuWVGQhQnO5w5
 Nu14+ddT76cw1N8wjow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

On Tue, Jan 13, 2026 at 04:09:13PM +0000, Alexander Koskovich wrote:
> On Tuesday, January 13th, 2026 at 10:59 AM, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> 
> > Are you trying to modify hyp dtb here ? how ?
> > 
> > blair is very old SoC and may not be running with Gunyah at all.
> 
> No, don't have the means to modify hyp dtb. Was just guessing at reasons why this issue occurs.
> 
> Was just using blair since it's the only secure boot off platform I had on hand so only one I could flash ABL on, but if it's using a different hypervisor than not really a relevant test then.
> 

Just to clarify you said, there is no issue if you just use dtb and not use dtbo ?
And issue happen when you start using a dtbo, even a dummy one, right ?

-Mukesh

> Alex

-- 
-Mukesh Ojha

