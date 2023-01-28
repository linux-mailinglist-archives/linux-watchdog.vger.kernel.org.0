Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E5D67F35D
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Jan 2023 01:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbjA1Ayd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Jan 2023 19:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbjA1Ayc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Jan 2023 19:54:32 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4368324B
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Jan 2023 16:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674867270; x=1706403270;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=8HroFzcMUn53K8eqs6JLXQhk7cTtRl6khnafxvlvf58=;
  b=VVunoUzRW73PFTr+OUe6+WCXr7dQn1aH2Kki7QMTGHwg4J2uMo64R+w2
   PDexZqS1RRjcKizTtf7jhwx2VRLXgI3ZbyoMrRvRMJfgZB17GCO5N6NXF
   /Th+aQu3Jh8+LRSYD1gHYSofR94Tea0YP53bjChojz2AJ+XmNd3yH9bU9
   PT3yzyPr5kRFM19F/nira5iKZKb/vMzmX86rKIIqakqZHG4gQ0ZY/A6zZ
   869q0TGz7uQptjsPfA78cgE8E6OBQRNYCBaOJyUJX3uZwgULpiWy+Nz3u
   f9yo+Vn9jOEE+rdegPXZzDd5MR5bIx4edQ/XetYq2RTtYXXViNPHQocVx
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,252,1669046400"; 
   d="scan'208";a="221742369"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2023 08:54:18 +0800
IronPort-SDR: ZQD8tuxcrWsxdsa8GjY1V8o1/nsvrvcpSejyXprqRE7+IIQ67NED7IYt7uCD4Vk1KJ9NopzpNz
 /zKkQy85Ta1KZRsqD3deeO6guXjgBZqb6jS9vQ100KQlVxAUMcZrRyc4DeKTFJd29PJsaj0u/E
 1LqrsfPzf18CdfrOJ0dv0e15gJFoKbkKpuG77Jcye1OBbjOxetuWNln4txSNe/UojqGmrhdHew
 k7hLk1KL3VxCANRy1R0ht72xF72Tk8flHkVnheAA0PmrGVkE34OOOKQUf3p/spLtjeuxAB44PD
 5+4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 16:06:03 -0800
IronPort-SDR: h9HGW+dWDywPcaYLYGjz5p2YRbAsQvPG9YJliHd1jNqdAJ/mYmGl76O2dOK6TVcb+Rcf0naE3U
 hW9BODDJKJpJzRPb3zAu6b5BtYgbggPJE6BZ4hN0egS5eFi/tRqnOCRiM/rEMN7rF3//PrWavf
 lBMvQ8hJR6kAJObqQnSqpX4wJCJfRwOSFng4wbJv+/3WUO6sT5215N+JabA22oZn2hDXE7utmq
 R6QMxq1Ndi9Pz4uuIQr09CErPEwYxpDmEA4Jbj4Ev84q2r6K8uI7TgOGIHer1TFEscEMMrQjZY
 R9U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2023 16:54:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P3bYj6vKJz1RWxq
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Jan 2023 16:54:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674867257; x=1677459258; bh=8HroFzcMUn53K8eqs6JLXQhk7cTtRl6khna
        fxvlvf58=; b=H9do5qanQi9148CyOZRY31twpwGXvzGd0cSTgoJtixngz9LbUqz
        80l1x6g2EzjCuD9qG06LQWbgZ26LOCsLbZ+w+qUGqhU8pNNi1EIo/K0SqBqtSztx
        PYoVBe+gmRbzKai9NPzcXuvUlSBzda1LSZmH8Pz06CXgZUc2AM9EgqTxXR9Q8TdW
        P5ApukYTGyXDgNAVeUrY3Qo2O4iEwELzu3GsJAZoPZYA/k7u3hReVbJEujoiQUqJ
        3pQguqmYg5FjWgj17c3/2K/pp7UlNLgJ0lAU7Doa6szicmCdoOX7V5D3kZjr+lh1
        Vr9qaxuKaVTaCNw0M6dD9nwXNMuUSF9lO7w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id WbwYVqC9mNfH for <linux-watchdog@vger.kernel.org>;
        Fri, 27 Jan 2023 16:54:17 -0800 (PST)
Received: from [10.225.163.66] (unknown [10.225.163.66])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P3bYd1nCCz1RvLy;
        Fri, 27 Jan 2023 16:54:12 -0800 (PST)
Message-ID: <75aa04c9-e173-6a2d-6b38-d0e16f3800aa@opensource.wdc.com>
Date:   Sat, 28 Jan 2023 09:54:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] dt-bindings: reference MC peripheral properties in
 relevant devices
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>,
        - <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
 <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/27/23 18:32, Krzysztof Kozlowski wrote:
> Several devices can be attached to memory controllers (or memory-mapped
> buses), thus they can come with additional controller-specific
> properties, e.g. devices wired under Intel IXP4XX bus: cfi-flash,
> intel,ixp4xx-compact-flash, NS8250 serial and MAX6369 watchdog.
> 
> Referencing Memory Controller or IXP4XX bus peripheral properties fixes
> few dtbs_check warnings like:
> 
>   intel-ixp42x-gateworks-gw2348.dtb: ide@1,0: Unevaluated properties are not allowed
>     ('intel,ixp4xx-eb-ahb-split-transfers', 'intel,ixp4xx-eb-byte-access', ... ' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

